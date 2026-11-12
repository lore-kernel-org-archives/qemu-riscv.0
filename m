Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B436A606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 13:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QAaoUFu6
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRUo4-0002vc-My; Thu, 12 Nov 2026 08:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRUo0-0002nI-7N
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 08:25:33 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRUny-0007pH-Ot
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 08:25:31 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-8b2d14968c9so46510407b3.0
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 05:25:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794489929; cv=none;
 d=google.com; s=arc-20260327;
 b=jb4r+LR0XYF+601hnMx4YQlP2/cEd/fT5DXr+6WNnxNAM/l6F9ayvb4yhECeqHxqOF
 8/2ub+uHUFyo3IWZQ+7FY5Vd6d16vnhZ9pouh32YES4IKN9buIQuU322NrxQprqGRnTu
 A5az6P2hd7T6hHNtf3RSXV4GSiYtVc4CxlOd5qfrKoHrJULJlfhI80j5a3zJzfCyeyrm
 NMap7wMD6/y4zFfC1VHm9926NOocBXl4IZ167lls0TvvH5Lxpvc6SA0e9EiTRS8sy7ZG
 39/Z+aGcJkpyUwtNVJ075iFqhM/nsF6k7PNJBvofreyGzh4yeT+L1WzLLnKXZK4Qi9fN
 q63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=owGl/RB8+MhjCv0gdguTj+3UJocSFxqUClURhRfmHak=;
 fh=13D0RMeOSu+gdsNgMzfOznJPxENgXoGJcNlsfgeC/Jg=;
 b=RJyFldqhIcf0sE9dPSZdH/r7GRw2t16CRdKX7iJ8a/UuqWqO71cj4aNnS9V7ccZIUw
 pNyE9m8xYZx9yyVsgige89JlqBS9bjyk7H/mxzElVEcxrX9/ltdtsy8WSKAvPkRyd46J
 wrrCCCOVnOX37n1zxR+UZbtV2oapMAmMDZs8seEns6WUJrB7V3Y5RoxLeCZ4In4tdCc5
 wykY9npqWCoIJowhaMMMalZNUPfMb7tCjBfgjwnH7vjOQaFMfnKd3xb0O+06/v7jrJ/N
 ma7AKSJF6dpSgYdTz49BDPcdHZ4d8ddqBzdR+I+tkhmRWDJCQJKMInFYub3wcUJySv+u
 55JA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794489929; x=1795094729; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=owGl/RB8+MhjCv0gdguTj+3UJocSFxqUClURhRfmHak=;
 b=QAaoUFu678tA+iL3HU6DkVkcGPt1QR7wb6YhiZWNhfrFfTCXJyWIvC2dKAQ14lZdlR
 ad0feHblF1x2S8UtuTq7upPg8U4txsOsnFPrCXkjo6HUVsPnwRbt7YLRTtcqTb3FeB7w
 3kCMsw2xMjxovHpJlli0+iuZvjf4ihdDwlKDdVIfotSlwO5lbRcvidv8Rq84MsKZxkBd
 BV+U8kqm04bX6eSaGJM0NEpH8HdplZpKAeBOVzZvrsrMdSTQ4REQnKw0bw94Ymnl69n5
 9atZaYvWWaIEzhHxS046xpQfl71OvZirwW6OiWUTUdyUliInt9cHDAJhOf/jPDmdYBSv
 yAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794489929; x=1795094729;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=owGl/RB8+MhjCv0gdguTj+3UJocSFxqUClURhRfmHak=;
 b=wpFUiLEwcTvqnZkGkrCO1Fv55QMyr2osTzZ3yYPJu+X954Y+9ZONWD4ZoGpvkafZTX
 m4UKRJMcAGsfQ752HVSCuc+g80F3tMZogZExStKpfD3nf5vum4baYL3mga/gDFWitJg4
 hSyfPxotsDa0vfcg+KQQ+8OXx+dpcL53WOw/Tw8DeUCkBKvxaTBG5wmSOOZEyV9nhqei
 OKh/Wi5IIyxrz4rcuIXOYsqAwSUWs8lNbapSs9I8kU0yzq7uQeyF5ykdV0xVmBNvylMi
 NyIemxwRhiHHZG1SGxvyqDETTjrnSSr10PnWltzWx52YFe6tNRypLYpOB+MuOeRJku3O
 9sPw==
X-Gm-Message-State: APuU4Z/lByyiuJOqdu3k9zO9T+r6+Di0TpwQHnYoH7Bn4u0I+ulJIbIs
 bK3xYofilTmcS5FemJ1D8BQbtXVPSkGw+P9nOv5oQJ+6ewXWqvNQVm5JMKdcsDuRJBIQbGopQF0
 vTcg6qsoki05aZDfJ2spVHSPO0f7L/H+mFqg23nVU3w==
X-Gm-Gg: AYBFou1aeDczJv5N7euFm44N16XYY2QFLf8sG9Iec83l3N/fxnL7BH9dxsYyKBO73Cm
 PWumvSFeA5quj8BSg92A6tk95NWVrdzJPLfQ8hSJHotGIjFCv2xFsze9FHF7c0jlZnn7nAWM8w9
 TFUHQU5Ea0lYBfn+fRiqmxJeJL+r7vE3LMWYTE6wzsgx8xgVgVVySWsilMB6gryRdJLuBY62jL+
 5wM2hi/O/NeugMRUw0/mAQgTcDznSL7EEF5j4rlHWwY2maW9d5faQrz6rOpmMB434+ZAsywVCqh
 u910E3bxZWbAYRF3u/abLoMNjunYwWaCM8z+MUMHmgbeSQu/Jh7iz1NRlcTMbtfYebPF4qmh2oz
 Xv1lIiy7JRKMd4tf3cVpBtxm6HYzvENLg7PdbOdw9WSPnuUPAkhKcA9X9dUdgkZCxzzNuUBwRWm
 zbGKosjJJSUEnF9CBEfyoD
X-Received: by 2002:a05:690e:4853:b0:679:a8f4:afb8 with SMTP id
 956f58d0204a3-67c68078b4emr2319843d50.114.1794489928798; Thu, 12 Nov 2026
 05:25:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106163657.3825938-1-peter.maydell@linaro.org>
In-Reply-To: <20261106163657.3825938-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2026 13:25:15 +0000
X-Gm-Features: AclHuK-BFHVld8JC-5-Tc6LJsYHos9GkH8dgMgcUSvXf3jdQU_3gkzlRu5RfZ4U
Message-ID: <CAFEAcA9_pEwO9dotcMmKRJBjqHNqu1OzZWxVzEHHVBddvzBOxw@mail.gmail.com>
Subject: Re: [PATCH v2 for-11.2 0/2] Fix 'version' arg of VMSTATE_PTIMER
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, 
 Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 6 Nov 2026 at 16:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The VMSTATE_PTIMER macro is defined to pass a 'version' argument of 1
> to VMSTATE_STRUCT_POINTER_TEST_V.  This means that the field will
> only be used in migration when the vmstate struct that uses
> VMSTATE_PTIMER has a version_id of at least 1.  This doesn't match
> how we define other VMSTATE_FOO which don't take an explicit
> version_id, which is to use a version argument of 0 (e.g. all the
> common macros like VMSTATE_UINT32 are written to pass 0 to their
> VMSTATE_UINT32_V counterparts, and so on). It also doesn't match
> how we define VMSTATE_PTIMER_ARRAY.
>
> The practical effect of this is that users of VMSTATE_PTIMER in
> vmstate structs which explicitly or implicitly have a version_id of 0
> were actually not getting their ptimers migrated.

As these are both reviewed I'm going to take the series via
target-arm.next.

-- PMM

