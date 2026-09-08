Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1B4C79F82
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 16:26:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3ydV-0002DI-Lg; Tue, 08 Sep 2026 12:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3ydU-0002Cg-HB
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 12:25:28 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3ydR-0005bB-HL
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 12:25:28 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 00721157ae682-85d46e4cdcaso1269047b3.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 09:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788884724; cv=none;
 d=google.com; s=arc-20260327;
 b=NOAysrwXUndohMxmS/VmB6201/7WdEnxGorejmo+c7hK6/VT9R4LSJ7DTAh2za6yA2
 ff3rI5q36ZjGjDAKvdTFXqTwjjmuUgBnbhgaPpeh4lsSwosakH4TgyL0IBYFnExfrwB6
 ckdTnXylP4Nk+am3+gSyKLFrhyC8UlYe2iWbOdjBbcagbDvXwh9Eula2lt2sMyP4mtIr
 p3plf0nijHkFfQO3ouoggDSCKMw/J0sxpHYrmS3/XqeoHkQ5m3nMuIMm+qWXDJGIQWbK
 /1RrqfIxC2vBqfoDR9gIU2IIgnQn4qSHZP3BzY40ftbASLCfafvN56S5o5zY+sKiQWg8
 BAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=my+ZFhuaujN6LDeHb7IAmbevvxBSmQi3eP+e5gOqJh4=;
 fh=O/sJA/6Hb9YPv8rw4w2albD3zAG8CnOsYgT6PIHsZDs=;
 b=XPrj7ky2gbIMQOAoy9fVAzOTA3jqzt7nG+nGwjtYo5vVwmQ31UNtfSZ0EPiU5vjP9Y
 1OJeKiDy6eASL6M7BZHtgFEI2/LHy226+i+f4k5l6PpIKElQSvuOVH0jJdAkMjgzvFpu
 euB33jEEdBtz198jayCx3syzkJtawb1PNlOV+cHJSJjzcjEqJjlaCYx+bxC1OeomJ6FS
 e1Pndc2XyH2VzDl1GwfqJmqke1gfyFtxaWK9bAWg2tNiiimnNNynoCdopVad//ilCScX
 mUoWnQAAptOGseCv4XAYSOJKpsGziqOGFk7nm6HpcHGR0Q48iWKiXzBGD3833kveGmGL
 VPow==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788884724; x=1789489524; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=my+ZFhuaujN6LDeHb7IAmbevvxBSmQi3eP+e5gOqJh4=;
 b=qIdXS8LXE1biTSknkLgLe3NKGlOVD6buW4lAn5DcMDZLDQMo9EvIHP5tn30JKqp/kS
 m/V+p8xufIxdbJVnHskLnRRE8OAlHhIFdUxRej8NJbtlBn+JE2T7pIPyURgzZGsrf+eO
 CFzvEAw+yr+beUIhfoC3djlQW5GxgZxoL4Nl3wrzVMpJbLheZ2eBqExp1hSWtS2sprq3
 fQLS+RjTx4nZW6HEwN6UuhjgvFJm/vFIvW4lMq8BAejjtXSQdtcCrQB/Gjkh79joWeI0
 8a5h4WKDrz2j+vUWhPRB7g/dAvaodkb+xlIkkw2B3ShLx90edwLiQ/8PmA3Hf0+xuYSm
 EpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788884724; x=1789489524;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=my+ZFhuaujN6LDeHb7IAmbevvxBSmQi3eP+e5gOqJh4=;
 b=b2/NMHKTDhQiys6xHkYG7RiYYYnAUAJEjD1LkK2v0yNJ7z60vPhlYRvw9tOnGWWUPB
 IkWeuL2hu8K8ag2vfJeM7yP5vc3pRljQE3tnbWHDIXYc2sUZ8QC5GsWB0VdDGZdyy/dl
 2vnaZMddJt/fozvaFVi8pkQHFy+e8wY+bTVeBqd6bMdZFDc1I0Iy3TowZ90YAMWwlUlm
 S9hFG1YfuHccAVfbTVpcJ0eZbZQsYeElbUBdgqMHXqHz0U2flA4cbwTh2RM9DG3Vy2M1
 xQjkkOX0zx8sASEqSHgaX651qAKdugJkLPXc703/E6bAA6qw//GS71K9+UQw1VWkCc07
 nUuw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwBvmdOR4JdZ88gnkAYVgcXeI1jcCQGzaSBR0VL5QBxYOm0MGn7GUwz9rUL6vqmX4OEjqE+tup0VK38@nongnu.org
X-Gm-Message-State: AFuF++ljggU7CDkfoTcQySxDc0an+Ghnp8eDldEkgAHIi7B0+1fE7STA
 DiYvIbNTaYj/CstqIxaG4MYeVa3RaKy0q9MDxJbr+YnprHAzpHldRSVIMFwLzEyZkMCLpgpXDrK
 HGvGs+VJA760kXdTfV8jW50b9kUpUBIQbFNvGrQhejg==
X-Gm-Gg: AYBFou26bHGcMZANxfClCvU9OSYt2SjGNM0YXcrPr6GixxKUt/+lZPoxoZP/6fBF3R+
 einV7sWA434aLbUSfEhyAXkObZYtqQuwhN0MQKlVWFCC5DO8JNqXiiVieyLng5nCPFi9H70uxAr
 sKdrcU3J13uHYZehM7LzA5be8ye+6KhayVFjXw4xLWV5rtBnfBoV5RKIcNjD4LQMeS8YGwPteUu
 7pOrazWdE1DbWM2E8DT5C9oG6r1fEWzDFjzeyG3SlRodMGw4hm+qi/hI18aG8IQCBNA9Tb+b8NS
 V/SIpwrnjPg5XwMjUInr2wiQuRZVGoU0hxtGe+DwHVaMRjcPxt1fhETuu1dcUg7irShIoHFuwLo
 GW9iFC9T666MkcBNE3lA+ZcVb0qTw
X-Received: by 2002:a05:690c:e152:10b0:7ff:1a93:be35 with SMTP id
 00721157ae682-87f27057c86mr3434427b3.16.1788884723700; Tue, 08 Sep 2026
 09:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-5-philmd@oss.qualcomm.com>
In-Reply-To: <20260902152044.31291-5-philmd@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2026 17:25:12 +0100
X-Gm-Features: AcwNN1V4XIKVs54SK6sImGEmX9ljAGTNQW2lfGrMMj2QVZXtln3ANID7z7SOkSk
Message-ID: <CAFEAcA-9R6ov530pA5FV6=ECr9qj5HP7yz=O4YtyCDJDP3qc6Q@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] accel/tcg: Document cpu_exec_interrupt()
 callback contract
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
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

On Wed, 2 Sept 2026 at 16:21, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Expand docstring to clarify that @interrupt_request is a bitmask,
> the handler is called with BQL held, and document the return value
> semantics. Fix typo in arm_cpu_exec_interrupt() documentation
> (s/inrerrupt/interrupt).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  include/accel/tcg/cpu-ops.h | 15 ++++++++++++++-
>  target/arm/internals.h      |  2 +-
>  2 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
> index ded7cc700df..87850402203 100644
> --- a/include/accel/tcg/cpu-ops.h
> +++ b/include/accel/tcg/cpu-ops.h
> @@ -171,8 +171,21 @@ struct TCGCPUOps {
>  #else
>      /** @do_interrupt: Callback for interrupt handling.  */
>      void (*do_interrupt)(CPUState *cpu);
> -    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_e=
xec */
> +
> +    /**
> +     * @cpu_exec_interrupt: Callback for processing target-specific inte=
rrupts
> +     * @cpu: cpu context
> +     * @interrupt_request: Bitmask of pending interrupts
> +     *
> +     * Called from cpu_handle_interrupt() with the BQL held. Process the
> +     * pending interrupt according to the target specific @interrupt_req=
uest
> +     * masking rules.

I think we could clarify this a little to explain what to do with
multiple pending interrupts. How about:

Identify which, if any, of the possibly multiple pending interrupts
specified by @interrupt_request should be taken, using the target
architecture's rules for interrupt prioritization and masking.
If an interrupt can validly be taken, take it (by updating the
emulated CPU state for an interrupt entry).

?

(I'm trying to get across that the function sets things up
for execution of the interrupt handler as the next thing, it
doesn't cause the whole interrupt handler to run. But maybe
that's obvious enough we don't need to say so.)

> +     *
> +     * Returns: %true if an interrupt was processed and the next TB shou=
ld
> +     * be restarted, %false to continue normal execution.
> +     */
>      bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
> +
>      /** @cpu_exec_reset: Callback for reset in cpu_exec.  */
>      void (*cpu_exec_reset)(CPUState *cpu);
>      /**
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 1775835ad50..551a6b4a872 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1248,7 +1248,7 @@ static inline const char *aarch32_mode_name(uint32_=
t psr)
>  }
>
>  /**
> - * arm_cpu_exec_interrupt(): Implementation of the cpu_exec_inrerrupt ho=
ok.
> + * arm_cpu_exec_interrupt(): Implementation of the cpu_exec_interrupt ho=
ok.
>   */
>  bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>

-- PMM

