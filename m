Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14F1C5DF66
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 16:02:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvzmH-0007Ux-4I; Mon, 17 Aug 2026 12:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzl3-00074c-Aa
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 12:00:23 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzl1-00065S-68
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 12:00:16 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-836cde02992so31444307b3.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 09:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786982413; cv=none;
 d=google.com; s=arc-20260327;
 b=T0jzMIS2kAxN8zfDSAvX9y1poJE9e3fh23RrRYF4zRZ5vwqvLgy5okSg0MnLXmDgR0
 Z00TlikNd6rMfmaYAbeeFXXNI1nHIkAAtx8mN3YkSxMj7X+1w2cGykL+B7/q2qKmmQaK
 Zcr7aeGZHPABCTxfWfCtOIkh8oHXtv1dBwvR4sZZOxNq6kYRcooN0EZyXy/8kXCalrZl
 3lfREVYT7oxmQgVaVKkA5aJqvZni5vvS285Kje7J4HG5CK7/9btxuDvygmprcXPns7fw
 cGLc9ATl8ez6KroazSUTixIhmZReerEhtoCY/+LsP4c9RqjQXkwk63N/MQbhC0sZhBR2
 Hxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=u0v20WHATN4inOkpw4dTSEM5J6s+dmnOJCNOR4bt+A0=;
 fh=pvUZ0judeUIKv9U86HjixMlBr0DQ8iGCaS6GpYOLT3U=;
 b=OGtIGh6cIJP+SnKfpKAY/VDtpAKGymVau49M7Dh72JcZ8fI3K0poo6i0Gijhar9riC
 gyW3aYx6wNw1Owb8QJSR1Efa032YUmOJ3JU+W/WO23kUpgu0HIpm9We2MfUeuowfrELa
 THKyHPOuGNjm7M+jBjXTKYdY/rcIOkUFPZK1GSVtyWRipsko/a5ize4GuYtMI5INlqfI
 gGE/B/KFMgxZjODWzxj7UlhPSwTCb5wnuWgh9Ry6xMyeWwujVDylCyAKDF+c8AF6GNdV
 +pOGl4aYQs1KVAZfm17EZRPpm9tEXpumJD34Wo2jPB0tRS2T+Hb/QaYEu9EuTyaV5SSU
 C+WA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786982413; x=1787587213; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=u0v20WHATN4inOkpw4dTSEM5J6s+dmnOJCNOR4bt+A0=;
 b=TcOVyzQx/A4fKoxi2qiQmKdqpiqqJ0jt5yoivbPIis5mhs3vBRGJAF9nQjJVQ+LlXH
 N0/MmiCeRQT/uC66ghiJGCpFNKBQukXlI5uq/nRZGf2rIdbAvTU5gb5TMAGGUHmGnr4Q
 InFyePsAMsEktTAuaL40BQYWXGDt5n8H4JdoF1ntwPkDP8hDVWHzeoHBqrzTTLM42VDM
 DlEeoUrdYS0T70Befcioyj9vuYV7J9NS4cudlcZh9E1XrUtJCC/GHSIkg4+rD9eXXtEf
 gqX3pMv6Wizaj19/9q5su5Qjite/GaH1mWWD5rtP3NqGlsCSg1Ct09ugScfqSesu1coa
 u4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786982413; x=1787587213;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=u0v20WHATN4inOkpw4dTSEM5J6s+dmnOJCNOR4bt+A0=;
 b=Zm2/0A5qTi6ybKs+WUVtTVuO2VZ/J9678TAGy5Op2i58M+cbMtcjh7zTLr7W2rMOCC
 AAutfP2sMehKYO+q8zpCpiMRxVdtJpMQOGLIYGyUkqtK925skvSBQ9ZJp8tKk9bQIek4
 utVnCMUhaNFdMD6kKNW3i6IFwsOnKNTjkBJW1eynFslVTRh9/1E2HJPGIv1EhEnXB5ux
 2mdiJwpKPS3U9EtAO8KQKoO7Arw3wdGccNKlMAP7FkKVFlKMKvQ5RXwAPQHbu8cAyllT
 TyhXcvlWjS+FE397/1RgguyuzMcW/8guvTsKgYgZRvpK6Ati+6wJ5ZrLTvWKTABe0CMS
 /SuA==
X-Forwarded-Encrypted: i=1;
 AHgh+RriJwp+O3WGmOct3y/h9bTOdxWsBsFdQSlvbYXu1o1oMUSh53JU3rXgF5jlhq8NOyj34HMJ1I3dCztv@nongnu.org
X-Gm-Message-State: AOJu0Yx0SoQ5sbqlTq2WdgijHxgrFJ0poxF2LKstmvt2s4daLk7gZl8a
 K0vQ/J6nBzjuv0q9eoKyCiIJi2Z7O3xiFwzfc7FxF+za+hhmahus6m3JshCVJ/FNSyjjTV3GF/a
 hkfWvBHk1mj7nN04NCc7XFnKZ1+htggOcF7bLSIZj+g==
X-Gm-Gg: AR+sD13KcOw8m5+dbB2ExkePQ0KMbRKViaYiLXCTT69Fyvv8OkKYkTx2PoUCw4q/ob0
 Uch6I1/qpoXyK0Yrk+S2zxsUhShJraxQSsSqHK6l41AUU4SSMvINk20+SkljHzYuu+dTmwZwm8q
 A70qD6Qoy6WJE9saeOx7Gbn08QPnnBjrzoYaS6GsVFn5ulaB36DGi2/w+oIwK8AjEugT0IPyBqQ
 Xm5f8AWyvYS9wUdWXZDG2r8crRP1cLuD/Fj2CHve83fCYYgaQHEzpnrZORV1LTaTaz2GYeXkJMZ
 4gis6FBcxdLXjAOX6dS6W3qQBnhjbcB+cLCCxk2ssOQtXiIx4Be/wUou9o0nazSzf5SF/JGdYus
 8JMmjai2CKTTa8n6rwU0nUFcuZKxp
X-Received: by 2002:a05:690c:a4c8:b0:81d:a1e5:a4d7 with SMTP id
 00721157ae682-8370c93d31amr76988627b3.5.1786982413325; Mon, 17 Aug 2026
 09:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
 <20260813181640.6537-9-philmd@oss.qualcomm.com>
 <0143f26e-eb64-4924-8e76-3b6ce66fe6db@redhat.com>
In-Reply-To: <0143f26e-eb64-4924-8e76-3b6ce66fe6db@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 17:00:01 +0100
X-Gm-Features: AcwNN1WKg9kcvA4JNKRjNxIc1m-gB0o4nyQG1KVRXlHPNyw8dOI79_GwpnDCC_k
Message-ID: <CAFEAcA9CzSeOKHiPdwUcowYhiSs2tcT0OR_j6mnyvykgMoaZLw@mail.gmail.com>
Subject: Re: [PATCH 08/16] cpus: Slightly improve *run_on_cpu() docstrings
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, kvm@vger.kernel.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Magnus Kulke <magnuskulke@linux.microsoft.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 17 Aug 2026 at 16:50, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 8/13/26 20:16, Philippe Mathieu-Daud=C3=A9 wrote:
> > Be a bit more precise mentioning BQL use and blocking calls.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> > ---
> >   include/hw/core/cpu.h | 36 ++++++++++++++++++++----------------
> >   1 file changed, 20 insertions(+), 16 deletions(-)
> >
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index 183ef9f4ef2..d610f87abd3 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -908,36 +908,40 @@ void do_run_on_cpu(CPUState *cpu, run_on_cpu_func=
 func, run_on_cpu_data data,
> >                      QemuMutex *mutex);
> >
> >   /**
> > - * run_on_cpu:
> > + * run_on_cpu - Execute a function on a vCPU and wait for completion
> >    * @cpu: The vCPU to run on.
> >    * @func: The function to be executed.
> >    * @data: Data to pass to the function.
> >    *
> > - * Schedules the function @func for execution on the vCPU @cpu.
> > + * Schedules the function @func for execution on the vCPU @cpu and
> > + * block until it completes.
> > + *
> > + * Note: The caller must hold the BQL.
> >    */
> >   void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data =
data);



> > +/**
> > + * async_safe_run_on_cpu - Queue a function to run with other vCPUs pa=
used
> > + * @cpu: The vCPU to run on.
> > + * @func: The function to be executed.
> > + * @data: Data to pass to the function.
> > + *
> > + * Schedules the function @func for execution on the vCPU @cpu asynchr=
onously.
> > + * Unlike async_run_on_cpu(), all other vCPUs are paused while @func e=
xecutes,
> > + * ensuring @cpu has exclusive access to shared state.
>
> Might as well mention that @func is run without the BQL taken and in
> fact must not take it (see comment in process_queued_cpu_work()).

We should also mention the massive bear-trap in the run_on_cpu()
function, which is that (a) you must call it with the BQL and
(b) it will *drop the BQL* during the course of execution, so the
caller must be prepared for other threads etc to be able to
reenter it, update state, etc between when it calls run_on_cpu()
and when it returns.

(cf https://gitlab.com/qemu-project/qemu/-/work_items/1109 where
we can segfault in the raspi display device, because
memory_region_snapshot_and_clear_dirty() drops the BQL and allows
the device code to be re-entered, much to its surprise.)

thanks
-- PMM

