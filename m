Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06442D33982
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 14:03:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t5QK6-0001Vq-83; Mon, 28 Oct 2024 10:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t5QJy-0001Tr-9n
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2024 10:02:14 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t5QJv-0007eu-Qn
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2024 10:02:13 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-20c8c50fdd9so33365545ad.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2024 07:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1730124130; x=1730728930;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wtG2C+LSWv2iJcbLJZP3g8IvrKiDABlL6MCN4sSJ+6o=;
 b=JJIfCQ2AhbN91IhH62afIEwT3nD34d+CUpG1CWq4L5nvp3IGBYMG9hjNBv/mzwn4lM
 fmxbmMvrIsPh/RcZJWFzFQixaURRAXxFnw6j9kIxhQbsIT5VsLxyX5eKQGLqwna0HZeq
 m2FBhifpQIR0Yw43UpREkBlhBf6BPMxqwpKc8trgLc0yxoTD+1HVGSqOUzv9W3+Vl+W+
 Yr6wQv0THOygpDoYuLspA7yNRdT0TRwNCtwPnzgGUl/5D9+H1PkVJj9yr+BwAjci69d6
 /7K44R+Zj4PTzruYYkB240nr55NubQZn3HjvLIHQfSZz6u5UXveM1FxRbdJTvcTgsFHY
 Djaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730124130; x=1730728930;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wtG2C+LSWv2iJcbLJZP3g8IvrKiDABlL6MCN4sSJ+6o=;
 b=vs2umGsn6NWGSIOyA7C44nn6COREIRVi9E07DfAH7PxVtERsXZgaqywm25FU5NRSv7
 a0WdLeTIX+Z4Q3PjnO8r/gr3LxVVd8p/r2tXheIgWf9TBVi/lNKCGMTQKlnD3kPgxfOa
 jRgKVSXIKaghdTd1+AZg6aGmF3b9+Kn3OA42CcUkghz1Kh85TEFBBIGmHv6LjlVCJ8xe
 S2Wig1d/rXb+GxtuCL76TGsnykWvo3VDe6crzvkXjeUf+KBw+W22I5LCmf+bMRklhcNx
 xRQ+jfBDotypaRkMCmmntmapmVKnUiTxK7pX2vWY4v3mFuX17LJlSxGlb1jyOn2MR4+t
 kZCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2M7nndBIGmXlaMm21xt48eaM+rhR/qTAD/M6M/RC0yLhs9BMqrQC96sl0MCFNQESlkNhN6kRbmLQj@nongnu.org
X-Gm-Message-State: AOJu0Yy9/rRHJYxksj6wvVYV9NrGqjGCoEq4gNl1CxlB+fDBZxr6QjlJ
 x70ArjchHF5YvABqiayL+DScHzpbeA8bLzPDWeGwmuZ5U3Dx2q0RxZTLDurd95A=
X-Google-Smtp-Source: AGHT+IHo1mAR7jr2QxzYThrwW4o26Iwv53mdqS/rlJx4QT5n8qEc5FSCLMoaIX1E7TbWT6+GQZKL5g==
X-Received: by 2002:a17:902:e804:b0:205:5d71:561e with SMTP id
 d9443c01a7336-210c5a76778mr135905415ad.26.1730124130198; 
 Mon, 28 Oct 2024 07:02:10 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:32ed:25ae:21b1:72d6?
 ([2400:4050:a840:1e00:32ed:25ae:21b1:72d6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf87e0fsm50570785ad.113.2024.10.28.07.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 07:02:09 -0700 (PDT)
Message-ID: <27ced2db-472d-47ae-9047-9efc0b589a1e@daynix.com>
Date: Mon, 28 Oct 2024 23:02:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] hw/display/apple-gfx: Introduce
 ParavirtualizedGraphics.Framework support
To: Phil Dennis-Jordan <phil@philjordan.eu>
Cc: qemu-devel@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 Alexander Graf <graf@amazon.com>
References: <20241024102813.9855-1-phil@philjordan.eu>
 <20241024102813.9855-3-phil@philjordan.eu>
 <9e310d5e-ab73-47b9-b9ed-5a16d4db3fb9@daynix.com>
 <CAAibmn0NA+K63OvrsBpN1HivndyZo-fgeLwzY8AVE4hPrQR26w@mail.gmail.com>
 <dd2aae75-348d-44ad-bbd9-5d45aad15bc6@daynix.com>
 <CAAibmn1z+7yizwH8DogfcCWOWzA8Ox6e=p+Hc1pu-CS4SjAirg@mail.gmail.com>
 <6a989d04-6416-4bd9-98ac-e1230a1095a9@daynix.com>
 <CAAibmn3YEOT0O55-bwJkpi_oEGkA1WwvhC0w3jGbgXOZLTVa0w@mail.gmail.com>
 <CAAibmn3HZeDeK8FrYhHa1GGwc+N8rBuB2VvMRm7LCt0mUGmsYQ@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAAibmn3HZeDeK8FrYhHa1GGwc+N8rBuB2VvMRm7LCt0mUGmsYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2024/10/28 22:31, Phil Dennis-Jordan wrote:
> 
> 
> On Mon, 28 Oct 2024 at 10:00, Phil Dennis-Jordan <phil@philjordan.eu 
> <mailto:phil@philjordan.eu>> wrote:
> 
> 
>          >      >
>          >      > Hmm. I think if we were to use that, we would need to
>         create a new
>          >      > QemuEvent for every job and destroy it afterward,
>         which seems
>          >     expensive.
>          >      > We can't rule out multiple concurrent jobs being
>         submitted, and the
>          >      > QemuEvent system only supports a single producer as
>         far as I can
>          >     tell.
>          >      >
>          >      > You can probably sort of hack around it with just one
>         QemuEvent by
>          >      > putting the qemu_event_wait into a loop and turning
>         the job.done
>          >     flag
>          >      > into an atomic (because it would now need to be
>         checked outside the
>          >      > lock) but this all seems unnecessarily complicated
>         considering the
>          >      > QemuEvent uses the same mechanism QemuCond/QemuMutex
>         internally
>          >     on macOS
>          >      > (the only platform relevant here), except we can use it as
>          >     intended with
>          >      > QemuCond/QemuMutex rather than having to work against the
>          >     abstraction.
>          >
>          >     I don't think it's going to be used concurrently. It
>         would be difficult
>          >     to reason even for the framework if it performs memory
>          >     unmapping/mapping/reading operations concurrently.
>          >
>          >
>          > I've just performed a very quick test by wrapping the job
>         submission/
>          > wait in the 2 mapMemory callbacks and the 1 readMemory
>         callback with
>          > atomic counters and logging whenever a counter went above 1.
>          >
>          >   * Overall, concurrent callbacks across all types were
>         common (many per
>          > second when the VM is busy). It's not exactly a "thundering
>         herd" (I
>          > never saw >2) but it's probably not a bad idea to use a separate
>          > condition variable for each job type. (task map, surface map,
>         memory read)
>          >   * While I did not observe any concurrent memory mapping
>         operations
>          > *within* a type of memory map (2 task mappings or 2 surface
>         mappings) I
>          > did see very occasional concurrent memory *read* callbacks.
>         These would,
>          > as far as I can tell, not be safe with QemuEvents, unless we
>         placed the
>          > event inside the job struct and init/destroyed it on every
>         callback
>          > (which seems like excessive overhead).
> 
>         I think we can tolerate that overhead. init/destroy essentially
>         sets the
>         fields in the data structure and I estimate its total size is
>         about 100
>         bytes. It is probably better than waking an irrelevant thread
>         up. I also
>         hope that keeps the code simple; it's not worthwhile adding code to
>         optimize this.
> 
> 
>     At least pthread_cond_{init,destroy} and
>     pthread_mutex_{init,destroy} don't make any syscalls, so yeah it's
>     probably an acceptable overhead.
> 
> 
> I've just experimented with QemuEvents created on-demand and ran into 
> some weird deadlocks, which then made me sit down and think about it 
> some more. I've come to the conclusion that creating (and crucially, 
> destroying) QemuEvents on demand in this way is not safe.
> 
> Specifically, you must not call qemu_event_destroy() - which 
> transitively destroys the mutex and condition variable - unless you can 
> guarantee that the qemu_event_set() call on that event object has completed.
> 
> In qemu_event_set, the event object's value is atomically set to EV_SET. 
> If the previous value was EV_BUSY, qemu_futex_wake() is called. All of 
> this is outside any mutex, however, so apart from memory coherence 
> (there are barriers) this can race with the waiting thread. 
> qemu_event_wait() reads the event's value. If EV_FREE, it's atomically 
> set to EV_BUSY. Then the mutex is locked, the value is checked again, 
> and if it's still EV_BUSY, it waits for the condition variable, 
> otherwise the mutex is immediately unlocked again. If the trigger 
> thread's qemu_event_set() flip to EV_SET occurs between the waiting 
> thread's two atomic reads of the value, the waiting thread will never 
> wait for the condition variable, but the trigger thread WILL try to 
> acquire the mutex and signal the condition variable in 
> qemu_futex_wake(), by which  time the waiting thread may have advanced 
> outside of qemu_event_wait().

Sorry if I'm making a mistake again, but the waiting thread won't set to 
EV_BUSY unless the value is EV_FREE on the second read so the trigger 
thread will not call qemu_futex_wake() if it manages to set to EV_SET 
before the second read, will it?

> 
> This is all fine usually, BUT if you destroy the QemuEvent immediately 
> after the qemu_event_wait() call, qemu_futex_wake() may try to lock a 
> mutex that has been destroyed, or signal a condition variable which has 
> been destroyed. I don't see a reasonable way of making this safe other 
> than using long-lived mutexes and condition variables. And anyway, we 
> have much, MUCH bigger contention/performance issues coming from almost 
> everything being covered by the BQL. (If waking these callbacks can even 
> be considered an issue: I haven't seen it show up in profiling, whereas 
> BQL contention very much does.)
> 
> I'll submit v5 of this patch set with separate condition variables for 
> each job type. This should make the occurrence of waking the wrong 
> thread quite rare, while reasoning about correctness is pretty 
> straightforward. I think that's good enough.
> 
> 
> 


