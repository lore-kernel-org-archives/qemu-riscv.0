Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D896606A32F
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 19:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FDuWT/Yn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xT2QJ-00072k-2C; Mon, 16 Nov 2026 14:31:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xT2QH-00070x-02
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 14:31:25 -0500
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xT2QE-0004JP-2S
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 14:31:23 -0500
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-67db8985419so2122941d50.1
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 11:31:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794857480; cv=none;
 d=google.com; s=arc-20260327;
 b=SmDwDV4ZQKj1LjLyJVhOY/a57TDHsQ7iQ0iDLvgtT7yLOdE2brBHpDQWcvFVPiP3rg
 fOjAjoBkSg+wGh4Y+fGGlYuidslNQfJvGJvHbtvGwfpx13Q2xjQmbttUSu2wPWNb6etd
 HF9brXtFS23vLWKWAI7yJYd6c2zPAvsJ9Zx+3fo9tCIitk7XhjvFPZCcu1h3/Lz1bS2a
 v6EhIz5wC8gQ0HDoeUsTG8MB1Or7ZVNIXSXGC7CK4jBG4zGGlvQFGV7HoDrQ/ukI/njq
 SVXFi7QYoEqQ6iYCj8JbcsX7/QFnjzQtxcjJ+e56TE4pTZPcBa20D86XFq/i0z9mY/4b
 LBrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hvQ2sCg1HfdyVsyadHrWzZgE0Ls85Df2r0H9rHDaW50=;
 fh=ox/Rl4AYK7xCqYgoCuwnx9xgZhRxVEapLTc37/K6FK0=;
 b=b8vBnd72aHSMxO3GqQyG1vF+P9nAAHlh8Cian8ohhj2UJWII1bv/UiJpN5DCOCQoPT
 bJ1GqXOsClb3f7+nexqyCf5uR44Im1m5/Gu4UdIDksUARFMo6R+WcQsBa6F+bUJmiiZ0
 UVMoCjXyvSGyHnICUcftLAcVqjV7wKlYBkJdCWOldTQlmDuoHjlZdFVzc8Z9Rj2bPedN
 XbgUeZtHJr1ISW5BOgCUmm3CuJonPFVtAUpS7RsGcFCHVT0EwApTifCe+J1oUu2QHeNd
 2HUJw1u3g/khTdYc4BP6T/9p1V4dHiWx8gobab2aIvtTf8AemQRgZZ8ygSqodNvytn2Z
 FfJw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794857480; x=1795462280; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=hvQ2sCg1HfdyVsyadHrWzZgE0Ls85Df2r0H9rHDaW50=;
 b=FDuWT/Ynrr2xN7kLkwA0AK+DCixTe9kXdPidqLVnpQn5deUzZdZyqE3zJho6SSG5pL
 /iA5VYTXoMo+MyeKPygCqO4GBHTabzidAF0duzW9i7KXB/dAX5ycIZc01l2aVIgiXm4r
 VFeFSzxJTyGl4JYC56CZlU+BubkL1pecEo/V88HhGubwhxfs8SpN83W25m9nOC70ugoO
 XHctzaALxTMQvWpVMzQ5JRNRp1tPrajHLWhRzA0QRMCxgn3qBPmwym9ej3MT4vRTJO8N
 3vHTI7uTqeSjjQaB7LNA2dDw2xc3/9NxpiBqohwcwcvCo9sqCvW6Nl8YD66JV2b/oPvV
 TkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794857480; x=1795462280;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hvQ2sCg1HfdyVsyadHrWzZgE0Ls85Df2r0H9rHDaW50=;
 b=ryU9F6+dYO0j2YZ0rfSky3/Wac4mbFuko742HbWex/BTcB6lz9Lrl16uDZTZrYArmQ
 vWGEUIctnLT2N2Wjzn2orXk/sis2teTBfxyNaTGosAEnTK8E59LQPZYYMV6yu3aYtbFN
 PYSNyBpSf0DaEsUS9nP4Dyv223cL47lHxpIYTZRoKq4P6bE28C4oBdgI8RsIpanrIpXL
 xZNze4arAeOEdbRFg740vEt+vMnnRlmcZjYak3wiA2a9GiddmeViSW6KlNc5ByrHzksY
 sKf9sARmOZjnSTmSijxdMKlM/hzDIoL2rfVsTvFhV4uOOhRia/BkDL8ft0lyJUfZEFxf
 Y8Kg==
X-Forwarded-Encrypted: i=1;
 AL+hErEZKjxGcfolOc7psyjH8olNDoGTwMbsBEnXfxeeAGQB+/jJioGAQnYXfHYc0nryvGgzAKTPACr7yWa1@nongnu.org
X-Gm-Message-State: APuU4Z/HnIRAb/y8oALIAAUC2aPLF4Rz8lFbIa8kTu2uZteNpmfHEBPq
 s06/R5ZDoGcY6zzgxgyZpfFIoIr+qhSef8gj/PxpEtgi+8K3hZ8PJzXzVVppr2CsFbi9ZvBcedw
 fZLLUeyJb/BeeLTeQulXtZJzKmnyVRiwJfm9MMD1/TQ==
X-Gm-Gg: AZFdTZdZO5F0WEQctLWsR1FJyvsexEIqELcHcIn7IGi3qj45h4k3Yx/9EL4iS4xATrI
 FfsFXhtcIf0zftTQetYRltvwnFsETPOQ/LuXpFu+a+YDjH1bNILJcMaYPGTFLud97kMqRHeCkBa
 8pzwwx6l8YG7xYVNruy2vwZjrvHczegYCYC8Syh29CEuAgqXlqQNAl2vi7QkUVRnPzZX8HDGo5+
 72oCGtIlWiE0a7pgM+CVG4DaftA87uJGvtSoE5meL6pJEArBKSKrLDcE2AoL1dlt3CXgyQu/Gow
 EAVqRtXxN2wqi45DlMnGOGuOtk3E/9h9POKe9bHkvwZuMLRlvwQ3CZJQ2w0WmEJnBGCQy+sDpKx
 /PqjFin57zrY0LLk1ZgZIc5+/+tKkDfr7LzUhB5p7B0I7SOPn1iHS3FyCdtDwCIZznYQQ6dWt3l
 RCy2FwsuJhnTB/wkaQxIg5
X-Received: by 2002:a05:690e:1688:b0:67d:babd:b80c with SMTP id
 956f58d0204a3-67dbabdc5aamr1889966d50.67.1794857479878; Mon, 16 Nov 2026
 11:31:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260821064032.49556-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20260821064032.49556-1-zhiwei_liu@linux.alibaba.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2026 19:31:08 +0000
X-Gm-Features: AclHuK86TOGoB8kRSwdXx4amVM7Dh5DygxvE65EO4LJUouj_so5MRTVNEi8304Q
Message-ID: <CAFEAcA8Nmt_Nsvfm77en_oaE4orcQ3BdCBQWNAXmi0iqLgV7fw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix RCsc store->load ordering of release stores
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, chao.liu@processmission.com, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 21 Aug 2026 at 07:40, LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>
> Several guest architectures give their store-release instructions RCsc
> semantics, which requires the store to be ordered not only after the
> memory operations that precede it, but also before any subsequent
> load-acquire with RCsc semantics.  The TCG translators, however, only
> emit the leading barrier before the store, so under MTTCG nothing
> prevents the host CPU from executing the load-acquire that follows a
> store-release before the store has left its store buffer.  On an x86
> host (TSO), store-load is the only reordering the hardware may
> perform, and it is exactly the ordering that is missing, so the
> architecturally forbidden [0,0] outcome of the Store Buffering litmus
> test is easy to observe:
>
>     CPU 0                      CPU 1
>     store-release X = 1        store-release Y = 1
>     load-acquire  r0 = Y       load-acquire  r1 = X
>
> The affected instructions are the RISC-V Zalasr store-release
> instructions and the Arm STLR, STLPUR and A32/T32 STL store-release
> instructions.  Neither architecture defines an RCpc store, so every
> store-release is RCsc (RVWMO preserved program order Rule 7; Arm
> Architecture Reference Manual DDI 0487, section B2.3.8 "Acquire and
> release semantics").
>
> Patch 1 fixes the RISC-V side and patch 2 the Arm side by emitting a
> full barrier after the store as well.  Patch 3 fixes an inverted
> barrier polarity found in the A32 LDA load-acquire translator while
> auditing the load-acquire side.

> LIU Zhiwei (3):
>   target/riscv: Fix RCsc ordering of Zalasr store-release
>   target/arm: Fix RCsc ordering of store-release instructions
>   target/arm: Fix barrier polarity of A32 LDA load-acquire

This series seems to have been accidentally missed, possibly
because it included both arm and riscv patches in the same
patchset. RTH tells me that the Arm patches are correct, and
Daniel has reviewed the riscv one.

riscv maintainers: are you OK with me queuing the whole set
including the riscv patch in target-arm.next, or would you
prefer to take the riscv patch yourself through your queue?

thanks
-- PMM

