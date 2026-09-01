Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215ECC624D3
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 15:44:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1Qek-000339-SW; Tue, 01 Sep 2026 11:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Qei-00032O-QD
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 11:44:12 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Qef-0005Ba-W6
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 11:44:12 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-8615bb9d857so664067b3.2
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 08:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277443; cv=none;
 d=google.com; s=arc-20260327;
 b=EWKZr24fhFSvH4jXfXQAp0v1ASgVP+9GHaCk3hyNZKJVPT2ixrApI36R6LuWL1S3F3
 9YW2AxstcTLOqThELbwQjJMkTmpKfSyOIlmiFwV6eoWDBvykK5J3FYBvbtFv3dJRExUC
 nga8ICZQSOnPOH+v15PQ8KKn8E49vMFFoTyTMLOg/wCGqEzrm9c+PSJOyBRpBZeXlsCk
 IWPfD7KbjDaT66dEr906mY/khIo9p2goqmxdOFJlo7x23I0+fbFKUXwuGRmABhzGVE/r
 xx5kqp8Po6VSbvCIFxe84qes1+qf0DyIXwolM920GdgIcXNCwydCcXCakEKvTBV5ObSk
 ENZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1kvjv5Gfdk/GMHKRwBrkjHRbEfyU/KRdl6K73Z8xPg4=;
 fh=8Uxh7OpRRGZ8EMXC4bcvrBbtQhqOna6MMvrk0HpBei4=;
 b=XJesnL6dw7+0Y3j9nt+WFMYZmdUIcdHtVkWVpHQyoR+cVD+eJfV3RvRo5d5PJIgbss
 6GFEkzkzbbNbrA+jt4RKEUaRMpPjs5VmePC9R83nn2iJpoO7GW2l1z/K7qE5iy3u/tTZ
 5YUi5BTvweZZTdFD4sG75HeQO97qOCcO9HaYdMryjAfH29K2VXnadTJ2SFDmR96n6yls
 13IwcdIiGl0FFdK7rfxhkx+nsC4b4CXf4X46wCJdMKYRunCPmr5ZJe+0j57UHq6fai9S
 Nu9PaujXrrAR4FrqEv4gSwm7/YTSlCObSPlHe7Qkklx3iDRhJDdqgYwgnBeYwbZLPF5z
 gO2A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788277443; x=1788882243; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=1kvjv5Gfdk/GMHKRwBrkjHRbEfyU/KRdl6K73Z8xPg4=;
 b=yUXEMo5tbn1ZAU/i7dVVbDJXLf8c9yN3NQT/6lsMoa2VV691vwqvBcT75HLl9VolWZ
 Lw/hgLCpJXi0UOqVlyrqHqgQA5X9goEm2bNHhHW4CNA9PGfglMBr2ol1tLFXwxwCGMUp
 5lQ2EijfjnCbePyx3f/aK1lMnYb4WDdZJgAq3OqpYfb8jXKirDM3uyWwYnl2oC13sRyN
 AHNUbKPMg2rcXtrHBwPVGpEmGNfpqSjffW9I/jrb62ssHwhFXgu8wjPAyED6LQSUypBg
 cIOVa5I3rE9o9uMUMxuvC7z3Iy4xmvPxY4HRMLNkOB3zq3kxLJ4rfee+ZGF04FSwy/b7
 iucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788277443; x=1788882243;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=1kvjv5Gfdk/GMHKRwBrkjHRbEfyU/KRdl6K73Z8xPg4=;
 b=eICys6YPwbyWXMHKUY1DlX9yAPu9+eeW9Nm+Ieb6L2GufzowUonoDZzfEVBCjJsaRO
 XL+mNhRjuzC37H0W6yxM0disjB+IrQSdl84AZAoAFzLbZEfvVTTWK3aROyK+CqNLJebP
 K3Wg9ezLgcFq7bYy3666oCROLgEBm71qY2UnV96r4IxG5aITugvhn2f/A8N3iN8XbAj7
 ctbt3qzOp7dk25KjddHoWXDnwU29pT1Nkmo1QIDbHdkioHR9MYTojJlzmK6Be47Ils8P
 KaIi5Drh5Rna9jOKqRkPV9cGRVCYT3ORaW06fvogw3HKHRBihvJsoFpa7T1F3iMfRdRG
 dDaQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwbtIexLmmEd1PlLHDzjex46HncOWGcx/nWVvQLQNa9H6juU7x8Y8K/o1IohZ8WeUsAQtG4gjwRoZwx@nongnu.org
X-Gm-Message-State: AFuF++kM8God1nV6AR/E3hhFIuqSMFi6ljLKSK9vwPNVo3T6M1iNNAMH
 BX//e1BA/MnOwgsWiw4WeIqUAEtRLh+oZwvi0nNWH4yYatw1WSsXna3EUrNKVk/MMbkpiTMGhJM
 cXvXUauz/g6/aWXP79zIgUDNTMhE+8ZpOMV77XIzzyQ==
X-Gm-Gg: AYBFou3L9TZMFbG3sdT2dUVf8+D9IAQTjAB3NchxWAlWDi8eNjGCp+EgG6OZdWMHpZ7
 JTtIg1FGqG28grePhE9ptUpKLoLt8U0YjRaZdil8ZlV0oMJy5xdkVxayGnQKBxyaVtynss+suDo
 FNkGBFEJxMZM54pASaFTcn1aGKIk9D5MUJdtKJB1x4i+JaoOBWImqdOvMKwol1aBu5L0jrOEhG/
 v2mdQKgLAu5ZPKBncXdRvvoD4LVzsIPAtMOCA1/OllqfbStgcwcl35ANMCeoBxT6tlvWrrNHpBo
 CXen6rtmMmpvrgCyHfq4W8Px2dDv4X7lPaub1t/QI8c7qY7c6rj7XQzMNpep4j/c2kNEvO+iKSR
 o4BbVG8TJ/deU6bNfo4hJv/3kBwYI
X-Received: by 2002:a05:690c:a642:b0:820:15ad:522c with SMTP id
 00721157ae682-85d67251799mr116246197b3.11.1788277443006; Tue, 01 Sep 2026
 08:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 16:43:51 +0100
X-Gm-Features: AcwNN1X_-5DwmKotV19zndnktRTnWLg1Di2wnrhkJJV_liuHxx3Ln1RlQZS1iok
Message-ID: <CAFEAcA9CXPA=3AHqqCu8Kv9iHUGra37wBUfVcikMdBrAkX54qQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/18] accel/tcg: Change tlb_fill/probe_access to
 (addr, first, last) tuple
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Sat, 15 Aug 2026 at 21:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The driver for this RFC is
> https://lore.kernel.org/qemu-devel/ce3a48b5-9847-4cc4-a02f-86db497c91ae@linaro.org/
>
> Based-on: 20260815194549.1377505-1-richard.henderson@linaro.org
> ("[PATCH 00/23] target/riscv: Reorg vector load/store")
>
> But also merged to master, so for avoidance of doubt:
> https://gitlab.com/rth7680/qemu/-/commits/tcg-probe
>
> Convert probe_access_full, probe_access_flags, and the backend tlb_fill
> hooks, but not (yet) probe_access itself.  I'm less certain about that,
> since its uses are (1) less complicated and (2) there's also a path,
> which I can't prove isn't used but neither can I find, which avoids
> both watchpoints and notdirty pages.
>
> I've tweaked the riscv pmp check to use the new parameters.
> The similar Armv8-M code is a bit more complicated to push through,
> and I need to study it a bit more.

I think this is a good API change, and getting rid of the confusing
"probe with size 0" is definitely worthwhile. I think we need to
be careful as we do this refactor about places where we calculate
a "last" address via "addr + size - 1" and that might wrap around;
I've left comments where I think that might happen.

thanks
-- PMM

