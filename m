Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D00CAC582
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 21:35:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uw5zR-0005yk-KQ; Tue, 09 Sep 2025 17:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1uw5zL-0005y9-Rx
 for qemu-riscv@nongnu.org; Tue, 09 Sep 2025 17:34:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1uw5z8-0007e0-Rq
 for qemu-riscv@nongnu.org; Tue, 09 Sep 2025 17:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757453671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YyfRiMuu99hZlnfL/4N0gyRNLF22iv7sfeQeqU+5yRk=;
 b=RBXVBuPee8QcSOTm1cNNcae3gCZ8QHPaJzNFZdjIrtXxzvAfYS6NWmWQsDzUhMQ/WxZF5F
 4+jsPKF4j1/J7gVzvBYv7G9T+Gg2y+fIv30gPaRffNS1WoeLlbOwsLABlo6lCfoBuqbAt6
 FOu4Tcr+e5+dav40WmZa4bArBPmbJg8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-IacmqAKfMDir7SZ91FYpjQ-1; Tue, 09 Sep 2025 17:34:30 -0400
X-MC-Unique: IacmqAKfMDir7SZ91FYpjQ-1
X-Mimecast-MFC-AGG-ID: IacmqAKfMDir7SZ91FYpjQ_1757453669
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b60d5eca3aso78054321cf.0
 for <qemu-riscv@nongnu.org>; Tue, 09 Sep 2025 14:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757453669; x=1758058469;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YyfRiMuu99hZlnfL/4N0gyRNLF22iv7sfeQeqU+5yRk=;
 b=Vx7ZjPe3NFJ4bmHTNcIu3B/IRUgw9Xwqjp1gl6jtpq0lCpKddhqxF+oTN42MHOoZhS
 8MXjOrW9Iv0/fEQzOs3Wzpj/PFNblRNSfisLvZoyOl+zpIH+KyfeZDSZGCbSnnMx39Lu
 rnEx8yQi3jegFPlto7xv86q5OwExPHLVmLv4bm1ikadJabtkoSQvB3B9+fI1sAkvUuwD
 S/iOEgfwff7rZqw3XW2kQpV3jRp3E/tH9T4mvA++kTch4WZI2WwsRw3O0u9I0T/9mirl
 u4z+KEE9wkkwCiypb+QoXxDAJMl1TbpE78L/mEJC3aGrKIkQ3AusIqSvORbRRlCk76Tn
 ROHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2q0MugXqBG2H1gUlKhFbru51zy0QutsJrJAoH+infNE9PkKua0i/ZuHuYiTmeFLFsxpciKd/jec8y@nongnu.org
X-Gm-Message-State: AOJu0Yz2Ws24xi7K2ZJohn6ihGjL3nAvOoIZpsT6MBACl6Xtea4JyX5C
 U1DkdX4OlKBlavtZ2zqS2JX9oNof2jL/kxSG/GUHoj7bio1OW8Hl/yROIxvaIdihmc/s+AnYSRg
 22gYRKaYf9Q8QMqa+6Id2nir/vuu27kxWVmALZx/ct6W7XljFYkdZW9ex
X-Gm-Gg: ASbGnctnHE9g8vx1p4VjDlMPb7yEFFQNghlp3FdZa6+VswpX+xPHopmnBjSDtCri4cV
 c2qtFPm+KzEITedq1ZmRDXp68Bp9gO2dgyPviN5Ah5JTiPtFZoM3NaJN/VejjD3xoMDG2leOaNK
 oohwDUj/dLejMRJSPV45/r+TcEBtPe1SJ7kPjDMv2VEzwWqJk3cbxn82iPNvZQo7QEtVL5gclid
 DMwFOOubVwtsS/F6yVRicxCTZQ3/xsSuNTRkm2GSifQot8/RRLhkM1EPk5eeaLVzv7fofmcU66J
 iytlJbCGO3rhbjmwWLkLhCgOnI6C9trGkiH4b12YJx9tBd/BnhLEWY8rIbpQTGSUCfzwZYIi8Wr
 MTiN5DblfM/KWazbsQiZZ2w==
X-Received: by 2002:a05:622a:1825:b0:4b3:d14:ddc6 with SMTP id
 d75a77b69052e-4b5f83860f8mr129298371cf.11.1757453669301; 
 Tue, 09 Sep 2025 14:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlgpnXav6OEuY5LQvyuPZJBHPkUGmlY/4osD9yeFVjpoazCpTWrrVr08houDFP5f1n3psVbQ==
X-Received: by 2002:a05:622a:1825:b0:4b3:d14:ddc6 with SMTP id
 d75a77b69052e-4b5f83860f8mr129298031cf.11.1757453668893; 
 Tue, 09 Sep 2025 14:34:28 -0700 (PDT)
Received: from x1.local
 (bras-base-aurron9134w-grc-11-174-89-135-121.dsl.bell.ca. [174.89.135.121])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-81b58c52cd3sm182715485a.5.2025.09.09.14.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 14:34:28 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:34:25 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: TANG Tiancheng <lyndra@linux.alibaba.com>, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH 2/3] hw/intc: Save timers array in RISC-V mtimer VMState
Message-ID: <aMCdYUZyQWQ4Qc4v@x1.local>
References: <20250909-timers-v1-0-7ee18a9d8f4b@linux.alibaba.com>
 <20250909-timers-v1-2-7ee18a9d8f4b@linux.alibaba.com>
 <aa5ea2e9-8d01-4d45-99fc-efa5e6061c8b@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <aa5ea2e9-8d01-4d45-99fc-efa5e6061c8b@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nKh8qAzl_-jTW7BQAsAPngsq0HgRvXtVI4tE10MpVJg_1757453669
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Sep 09, 2025 at 09:45:07AM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 9/9/25 6:46 AM, TANG Tiancheng wrote:
> > The current 'timecmp' field in vmstate_riscv_mtimer is insufficient to keep
> > timers functional after migration.
> > 
> > If an mtimer's entry in 'mtimer->timers' is active at the time the snapshot
> > is taken, it means riscv_aclint_mtimer_write_timecmp() has written to
> > 'mtimecmp' and scheduled a timer into QEMU's main loop 'timer_list'.
> > 
> > During snapshot save, these active timers must also be migrated; otherwise,
> > after snapshot load there is no mechanism to restore 'mtimer->timers' back
> > into the 'timer_list', and any pending timer events would be lost.
> > 
> > QEMU's migration framework commonly uses VMSTATE_TIMER_xxx macros to save
> > and restore 'QEMUTimer' variables. However, 'timers' is a pointer array
> > with variable length, and vmstate.h did not previously provide a helper
> > macro for such type.
> > 
> > This commit adds a new macro, 'VMSTATE_TIMER_PTR_VARRAY', to handle saving
> > and restoring a variable-length array of 'QEMUTimer *'. We then use this
> > macro to migrate the 'mtimer->timers' array, ensuring that timer events
> > remain scheduled correctly after snapshot load.
> > 
> > Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> > Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> > ---
> 
> LGTM but I wonder if changing one of the VMSTATE_TIMER_xxxx macros to accept
> variable length arrays is better than creating a new macro that only RISC-V
> cares about. Creating a new macro surely is easier and less messier than
> changing all existing callers though ...
> 
> I'll let the migration folks weight in. Thanks,

I didn't see a 2nd user, though..

I'd split VMSTATE_VARRAY_OF_POINTER_UINT32() into a separate patch, then
define VMSTATE_TIMER_PTR_VARRAY() in riscv .c files if that's the only
user, and if that helps readability.

Thanks,

> 
> Daniel
> 
> 
> 
> >   hw/intc/riscv_aclint.c      |  6 ++++--
> >   include/migration/vmstate.h | 14 ++++++++++++++
> >   2 files changed, 18 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> > index 318a9c8248432a8cd4c3f3fa990739917ecf7ca1..9f4c36e965e2aa379d75c0a9f656177f0dd82a45 100644
> > --- a/hw/intc/riscv_aclint.c
> > +++ b/hw/intc/riscv_aclint.c
> > @@ -323,13 +323,15 @@ static void riscv_aclint_mtimer_reset_enter(Object *obj, ResetType type)
> >   static const VMStateDescription vmstate_riscv_mtimer = {
> >       .name = "riscv_mtimer",
> > -    .version_id = 2,
> > -    .minimum_version_id = 2,
> > +    .version_id = 3,
> > +    .minimum_version_id = 3,
> >       .fields = (const VMStateField[]) {
> >               VMSTATE_UINT64(time_delta, RISCVAclintMTimerState),
> >               VMSTATE_VARRAY_UINT32(timecmp, RISCVAclintMTimerState,
> >                                     num_harts, 0,
> >                                     vmstate_info_uint64, uint64_t),
> > +            VMSTATE_TIMER_PTR_VARRAY(timers, RISCVAclintMTimerState,
> > +                                     num_harts),
> >               VMSTATE_END_OF_LIST()
> >           }
> >   };
> > diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> > index 1ff7bd9ac425ba67cd5ca7ad97bcf570f9e19abe..255e403e5a103188712425d95a719d181e1a7202 100644
> > --- a/include/migration/vmstate.h
> > +++ b/include/migration/vmstate.h
> > @@ -522,6 +522,16 @@ extern const VMStateInfo vmstate_info_qlist;
> >       .offset     = vmstate_offset_array(_s, _f, _type*, _n),          \
> >   }
> > +#define VMSTATE_VARRAY_OF_POINTER_UINT32(_field, _state, _field_num, _version, _info, _type) { \
> > +    .name       = (stringify(_field)),                                    \
> > +    .version_id = (_version),                                             \
> > +    .num_offset = vmstate_offset_value(_state, _field_num, uint32_t),     \
> > +    .info       = &(_info),                                               \
> > +    .size       = sizeof(_type),                                          \
> > +    .flags      = VMS_VARRAY_UINT32 | VMS_ARRAY_OF_POINTER | VMS_POINTER, \
> > +    .offset     = vmstate_offset_pointer(_state, _field, _type),          \
> > +}
> > +
> >   #define VMSTATE_STRUCT_SUB_ARRAY(_field, _state, _start, _num, _version, _vmsd, _type) { \
> >       .name       = (stringify(_field)),                                     \
> >       .version_id = (_version),                                              \
> > @@ -1035,6 +1045,10 @@ extern const VMStateInfo vmstate_info_qlist;
> >   #define VMSTATE_TIMER_PTR_ARRAY(_f, _s, _n)                              \
> >       VMSTATE_ARRAY_OF_POINTER(_f, _s, _n, 0, vmstate_info_timer, QEMUTimer *)
> > +#define VMSTATE_TIMER_PTR_VARRAY(_f, _s, _f_n)                        \
> > +VMSTATE_VARRAY_OF_POINTER_UINT32(_f, _s, _f_n, 0, vmstate_info_timer, \
> > +                                                        QEMUTimer *)
> > +
> >   #define VMSTATE_TIMER_TEST(_f, _s, _test)                             \
> >       VMSTATE_SINGLE_TEST(_f, _s, _test, 0, vmstate_info_timer, QEMUTimer)
> > 
> 

-- 
Peter Xu


