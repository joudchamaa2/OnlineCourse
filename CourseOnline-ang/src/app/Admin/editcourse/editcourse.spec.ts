import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Editcourse } from './editcourse';

describe('Editcourse', () => {
  let component: Editcourse;
  let fixture: ComponentFixture<Editcourse>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Editcourse]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Editcourse);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
