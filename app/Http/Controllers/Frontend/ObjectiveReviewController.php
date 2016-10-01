<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Requests\CreateObjectiveReviewRequest;
use App\Http\Requests\UpdateObjectiveReviewRequest;
use App\Repositories\ObjectiveReviewRepository;
use App\Http\Controllers\AppBaseController as InfyOmBaseController;
use Illuminate\Http\Request;
use Flash;
use Prettus\Repository\Criteria\RequestCriteria;
use Response;

class ObjectiveReviewController extends InfyOmBaseController
{
    /** @var  ObjectiveReviewRepository */
    private $objectiveReviewRepository;

    public function __construct(ObjectiveReviewRepository $objectiveReviewRepo)
    {
        $this->objectiveReviewRepository = $objectiveReviewRepo;
    }

    /**
     * Display a listing of the ObjectiveReview.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $this->objectiveReviewRepository->pushCriteria(new RequestCriteria($request));
        $objectiveReviews = $this->objectiveReviewRepository->all();

        return view('objectiveReviews.index')
            ->with('objectiveReviews', $objectiveReviews);
    }

    /**
     * Show the form for creating a new ObjectiveReview.
     *
     * @return Response
     */
    public function create()
    {
        return view('objectiveReviews.create');
    }

    /**
     * Store a newly created ObjectiveReview in storage.
     *
     * @param CreateObjectiveReviewRequest $request
     *
     * @return Response
     */
    public function store(CreateObjectiveReviewRequest $request)
    {
        $input = $request->all();

        $objectiveReview = $this->objectiveReviewRepository->create($input);

        Flash::success('ObjectiveReview saved successfully.');

        return redirect(route('objectiveReviews.index'));
    }

    /**
     * Display the specified ObjectiveReview.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $objectiveReview = $this->objectiveReviewRepository->findWithoutFail($id);

        if (empty($objectiveReview)) {
            Flash::error('ObjectiveReview not found');

            return redirect(route('objectiveReviews.index'));
        }

        return view('objectiveReviews.show')->with('objectiveReview', $objectiveReview);
    }

    /**
     * Show the form for editing the specified ObjectiveReview.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $objectiveReview = $this->objectiveReviewRepository->findWithoutFail($id);

        if (empty($objectiveReview)) {
            Flash::error('ObjectiveReview not found');

            return redirect(route('objectiveReviews.index'));
        }

        return view('objectiveReviews.edit')->with('objectiveReview', $objectiveReview);
    }

    /**
     * Update the specified ObjectiveReview in storage.
     *
     * @param  int              $id
     * @param UpdateObjectiveReviewRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateObjectiveReviewRequest $request)
    {
        $objectiveReview = $this->objectiveReviewRepository->findWithoutFail($id);

        if (empty($objectiveReview)) {
            Flash::error('ObjectiveReview not found');

            return redirect(route('objectiveReviews.index'));
        }

        $objectiveReview = $this->objectiveReviewRepository->update($request->all(), $id);

        Flash::success('ObjectiveReview updated successfully.');

        return redirect(route('objectiveReviews.index'));
    }

    /**
     * Remove the specified ObjectiveReview from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $objectiveReview = $this->objectiveReviewRepository->findWithoutFail($id);

        if (empty($objectiveReview)) {
            Flash::error('ObjectiveReview not found');

            return redirect(route('objectiveReviews.index'));
        }

        $this->objectiveReviewRepository->delete($id);

        Flash::success('ObjectiveReview deleted successfully.');

        return redirect(route('objectiveReviews.index'));
    }
}
