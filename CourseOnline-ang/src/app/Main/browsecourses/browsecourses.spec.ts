import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Browsecourses } from './browsecourses';

describe('Browsecourses', () => {
  let component: Browsecourses;
  let fixture: ComponentFixture<Browsecourses>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Browsecourses]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Browsecourses);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
