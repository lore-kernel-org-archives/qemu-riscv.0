Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC14CC79F99
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 23:45:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3j1k-0000il-BY; Mon, 07 Sep 2026 19:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x3j1f-0000iQ-Eu
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 19:45:23 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x3j1d-0006KW-Jt
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 19:45:23 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-66e64e6e3fbso3308583d50.2
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 16:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788824720; cv=none;
 d=google.com; s=arc-20260327;
 b=ll0Y3rKZNptXwg7/kI2neYuTS1lqOFKM8xzS46teYN1KIyZO/DxRgcALTkJZc9tsAI
 onIkX/APHK82U1SRt+puaGxB/LCcqz40Us5TyKBGZ4IRWztBD+2Yt0sCudliTfDlvC61
 WXD5JggCkbQFjcW0GX+PFdjHnWuGdn/krtBPN0H/rJPHgAwTLZIVVsU55f/RsFPdGlbY
 8S9ifiWuMnvk7FbM0w5Y1oa3tmXTnmT76oiDlkH6q2PYoiUiI7PvxR3MjAfC8Dj4j6bb
 /D9rDlMBlP5oj75DeuRL/M/C2CBB4bNOZhx63v+d/RoPCWJua8jXnBUMCkbd1gHHNPLX
 kFNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=pZGxf1XYLGfpDHnmJT4XCJ6rkrjJ3E2fMgnK/QvciZY=;
 fh=Dp/WKwYsICs8OIGvuDwmy8ZhENSiwsqI1Dew5Pxr51U=;
 b=JpOKCNhhqFF0Gz7wIh0nkrV/x/zH0neIwAkfpaFcXn6lhLqmbnbE8CNL/SqTsJS7dH
 uu2bYP3t1PfTFBFdr0T7AlE7CTVb9R4WAsok86piQgPoMUU2dcEMeKawGIPqZAeHB3LH
 8lGZGFtrg7uwiGK1+Zkm2pB9WJGKdbnsuyktjs9OW+AOGdHZ2Ssku41OdxuE5pVnUSTB
 Z5302FUN7ER7MOrepSRGbuwKo2hGopXR3rA8Y10PDTnrU3fcEkPGvPYe0stDVg1ZArRl
 HrIis13O1T5CEf5JLzuMtseuebgDko4ElFKLoS/6yviUBjyJCodImCsbFHqECbx/yE95
 BrYg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1788824720; x=1789429520; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=pZGxf1XYLGfpDHnmJT4XCJ6rkrjJ3E2fMgnK/QvciZY=;
 b=JdbDXcnwLpbvEx63T4dKwEPT1mnJkEkckebF5VszEeNBPCmtwC/pnKnurAuLCb788Y
 OlRuD22PQx1P1MjBuqRXHtLMnZwBOGiZeTRfbRsGUKHKT9tz/IcyP4QMvBo5KryaRdEL
 DaN9I3ccnHxXczvL2WfTe2BkG69X7X1oTpszs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788824720; x=1789429520;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=pZGxf1XYLGfpDHnmJT4XCJ6rkrjJ3E2fMgnK/QvciZY=;
 b=Wqt8lOr4aPpa9kYmLU3Kb9qRQ1GorPsB3AY60Cgpe1oqL0fYwzzTksO0BDUcwD2vO+
 8dbiH9TcL4KvFwr93GYOa6EIVsqXVXaw6u/+kDvBEe0LWWQVXRz7BgpkdNVp3Uyv6uaX
 vN6mQTlbaR/+q0f1rxOAbFVrvx30uzRCsArgxmLp/h9tclC7EdiVNw7cgd2NI29sOgJn
 rMp6spstfQtjv4NoLHbUVHWzH212GAgE23POFAFqbrUt+LjetbdJrvhOsMjn6RxgdwTK
 79HJibffF//CqrwLhNgPHtnKkqgyLEhIXRX3wDk6szMt2+MEVSDwesKtNmKmU5Ea5Ljo
 X5iw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxQ4C/yJDoJl+6Gek2oMAuHSxY+wanWTUaMIbj5NnGvvI0OaHnyKy7ayXEJxwV0A1L+8i9fhkG8/Fq8@nongnu.org
X-Gm-Message-State: AFuF++kGhaGcapq90OWAXffFHmgQhHcwKR+ckfUjk61JYgK1Vnrpyt+r
 fBvW6l/APRAV4kIH7ArnHqVLL2D2nTyyX4BI20+84oeEvrEIztlleq942gbQGNWWXEmxrgLOOEK
 Xdv6cnKiU8NVQveoFngEUmN5zf55iCKg=
X-Gm-Gg: AYBFou3B4lZKqBOgZRdx85LZLHyZ60jayxZUgDXhPNOEcYf2ZEoghLQM2VIKL6EIIGV
 n0xmOyVxhXlmzvSCFM0/xdKgdQOvjruhPaKnDyPm2jXhZmKXD715JtRf6ebJJW1YO3Is223icnE
 H+JcMT0KPPtmoysf110k8wxs+8SCx5b+zPWyi6gbR7w60f9LRZ6UNtWx5099/G02s3GC3OjYwZO
 q+FvZ6B49UKSeJg0YTN4q3pW+HpQcYxC+jv9ez6IpmnqatkPqAO36EgZw0dGohmP/VILBvln8Z2
 lek3ru9tl8ZNYOD8qjiZ6Kmy/KATnzj2g9ifXdEIRGxinnE9xzW5jgV4ArSBEXhx2gNJmhA6duX
 WG+N0+Go+KUDFhQ17yhlWYfQV/KDqPEX9RxIrp2J3fwm34kEjQhgpeLt1MjAiIC3J0v9odniWpa
 VPWAUxqfnHG0Xhl5u/
X-Received: by 2002:a05:690e:b44:b0:66e:5748:e04f with SMTP id
 956f58d0204a3-66fc1b2721emr6231389d50.20.1788824720326; Mon, 07 Sep 2026
 16:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260903170011.3627720-1-max.chou@sifive.com>
In-Reply-To: <20260903170011.3627720-1-max.chou@sifive.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Sep 2026 09:15:08 +0930
X-Gm-Features: AcwNN1X84fgBGT4YekBqrmYqvYXsNf34hVWm93A8cHkyMZha-z-AAkrunsVxuSQ
Message-ID: <CACPK8Xfc8o5kKbgZRnp+4nmSjUqZv9T6HbAJYZLFWx7=_9A0zw@mail.gmail.com>
Subject: Re: [PATCH] tcg/riscv64: Set vtype before whole-register vector moves
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb136.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, 4 Sept 2026 at 02:30, Max Chou <max.chou@sifive.com> wrote:
>
> According to the RISC-V unpriviledge spec,
>   "vset{i}vl{i} and whole register loads and stores do not depend upon
>    vtype."
> The whole-register vector move instructions reuqire legal vtype that
> trap when VILL is set.
>
> The tcg_out_mov in tcg/riscv64 missed the vtype setup before emitting the
> OPC_VMVNR_V.
>
> Fixes: d4be6ee1111 ("tcg/riscv: Implement vector mov/dup{m/i}")
> Signed-off-by: Max Chou <max.chou@sifive.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks! I had the same patch in my tree.

I hit a crash running qemu-x86_64 on top of qemu-system-riscv64 -cpu
rva23u64. Notably the spacemit K3 doesn't crash, but other (stricter)
implementations will.

Cheers,

Joel

