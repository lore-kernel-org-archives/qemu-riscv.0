Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A16606A320
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 08:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lkak0UTm
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTxsF-0002OD-06; Thu, 19 Nov 2026 03:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xTxs9-0002NK-V2
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 03:52:01 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xTxs7-0005nl-4p
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 03:52:01 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-cddff772fffso672526a12.0
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 00:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795078317; x=1795683117; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=o2NsXQHxx3KaZ0zGhFLxxkQI4DwB5UV7v0A21uuXZ5k=;
 b=lkak0UTmY1DVPmeBpcGD9DzP85EWssusFkI4KGbW5wEfOHnjvL6Yrq2D0JVywPDsvq
 g3Uagd8zi2DSL2A2BfrJdZhHo6P35OkQgbtHRsTCT63BXMf9EGLZyGVP/mQfuTa7EDFG
 yOTaQXVjAxQEKvVj23KxHWf7cY63T3Us4DEMvL4F0R+2nDRKL768Lm5PP6mwfmMriK8N
 KL9LcHnUb6WIQt81cSjFHtYzrztNtwbFY8ZWPOul/SirufW7yZtYfjHmNZD0k9dOPx1K
 F7dyMfugq9JMVXScAlbRvztTGirI7CPT0neuzXkDSI5MhQSsw0yBhi3QuI7PI+fNho0A
 FVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795078317; x=1795683117;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=o2NsXQHxx3KaZ0zGhFLxxkQI4DwB5UV7v0A21uuXZ5k=;
 b=0jR9ErkTflgNRuj5P0MqDmG9e1DZSeK9delxaDOU+sL4WlF2+SS5ZxoP/NYv8MvCMj
 EtgXrBB2/lHqzHE4+K30toyC86OW0g2dxGUR9RrTT9eWRBZR63KHCjJ9CZ3qTSrGZE4q
 Ba6/4ozCyqa2vUp/bSqMdLT90fsw5ZQ3JR8iuE5nd5qBUSIt2RpZ8Bo288/dwr9kbsPN
 i2VJBsgOX5IqELPEdrCaSiqKxMTTajg5ohAy1ZVbq7nRjYPgPq4x/JZQOaySTmaQcnAC
 wuyPZfQ0XPstvOJNzY7csV/9QE13eaFcsLJ8rom14Pi+F6x7FHBx1D+LGA211C1xZZUd
 OIfg==
X-Forwarded-Encrypted: i=1;
 AL+hErGDy4Wmnra+enJDoewWzAgf5mH/498glkMozJ7vs2UbgIDM8aDBFG09IqyY8dylY8pjgQ8XT6E+aRCR@nongnu.org
X-Gm-Message-State: APuU4Z/94tiWQfdoRq6ih0fFK9YYae59oYfgqxAiV2MHxUtGLEKUPJUQ
 bbFu5ekFdyQE56+IFQTYpscdzqiwJX+gKkMgbPvbJzbL7lZ9cZ0lHGds
X-Gm-Gg: AYBFou1OLi7t5AgrCai3CEUUz9XpoJZf74Luv2Hy8/8jVvKJDZYR8VoXeyHmIwDqjI7
 MbJANwNDHkukEmbWUwtjAJIxI9QHD8Z9hfitvO9ckqjfxB3dunzIzEY8zBychgbI6Y8hYBIXQG1
 dGTmkta/SPUBQ/NrygA2KbbpRRAQyQIe3W0ZGlD2YYWAy98/QscgdjfkYDon0f3Iq3nM89Gm2I6
 7rtus0Kx7jx+F/dc/IKQtauuV0ArLG0UIkaOx7jHXXUTTrH290dtHiz6IE7dL2Y7MCNxIKek4CZ
 GN20XKooofd6vgXY/9CiJPAuMJMSIZRQV83nIqPbtAcURahCQVagK4YyNzEJXscG+N6YK7YKA9k
 VQfXX4OCgy1kho/fpxsHyyM3H/dwpy/V5mfBoN8F+jUIfAkjFlxPwpoy00OUzYuhidOthAhcgQh
 vx0tYRwkvVlGdwT5bk0X1Day/ceFaU1zPBfz2NAyry00rmkbcceOX8iSmH2QLD5qcSpVaKuTByF
 rGkK6MWjiAblef7dNGrOSIwpyllM9v9yfEsGXiAXSiJ7ZgpPKQ4KU+vZLnQj45SlBN23wmlhQxO
 4uYJF5mqCma8sPX5cFvwP1GhFcafBNUOx2pTdQPFy6r+rQY=
X-Received: by 2002:a05:6300:670a:b0:3eb:b103:6ecd with SMTP id
 adf61e73a8af0-3fe970ebc87mr5335087637.19.1795078317055; 
 Thu, 19 Nov 2026 00:51:57 -0800 (PST)
Received: from [28.0.0.1] ([2406:da18:53e:a200:8d:28f3:134c:1c81])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cde534d9467sm1264710a12.24.2026.11.19.00.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 00:51:56 -0800 (PST)
Message-ID: <a10e39ea-fdeb-4bcb-a515-811e3de6760d@gmail.com>
Date: Thu, 19 Nov 2026 16:51:39 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] tcg: Support maxsz=4 in GVEC descriptors
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 Tao Tang <tangtao1634@phytium.com.cn>
References: <20261118-bug-issue-rvv-vlen32-gvec-v1-1-c15cf05de6bc@gmail.com>
 <1224bde0-91d8-4efe-8be4-bcd83afc450e@linaro.org>
Content-Language: en-US
From: WX Chen <wxchen0913@gmail.com>
In-Reply-To: <1224bde0-91d8-4efe-8be4-bcd83afc450e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=wxchen0913@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/19/26 04:27, Richard Henderson wrote:
> The obvious follow-up question is: what are you going to do with it?
> Is this intended only for use within riscv tcg helper functions? 

Yes. The main purpose is to make most RVV helpers executable in a right way
when VLEN=32. For moost of the RVV helpers, the RVV translator
will construct a GVEC descriptor before even calling the gen_helper_* .
Since the current descriptor rejects maxsz = 4, these helpers don't have
a chance to be executed when VLEN = 32, because the assertion is triggered
during translation(when --enable-debug-tcg on).

For the release version, which closes the --enable-debug-tcg, the
assertion will not exist in most cases. These helpers now may have the
chance to be executed, but not in a right way. For example, when
the user passes maxsz = 4, the DECODING result of maxsz will become:
   MAXSZ = 4 / 8 - 1              -> the subtraction wraps to UINT32_MAX
   lower 8 bits of MAXSZ          -> 255
   decoding MAXSZ: (255 + 1) * 8  -> 2048

This will mislead the helper that the physical vector register is
2048-bytes long.

> At minimum you need to adjust assertions elsewhere in tcg/ which 
> currently rely on the assertions that you're removing/moving. 
Thanks for pointing this out. After checking the call paths, I realized
that relaxing `simd_desc()` also broadens the accepted sizes for shared
helper-call interfaces, whose consumers may still assume a minimum size of
8 bytes. That's beyond the purpose and scope of this patch.

My initial thought is that maybe we can keep the current simd_desc() 
unchanged,
and add an explicit constructor for maxsz = 4, say, simd_desc_4(data). 
Then we can
explicitly call this one on paths verified to support the size? For RVV,
we could choose the constructor in common translation functions such as 
opivv_trans(),
  opivx_trans() and opivi_trans(). This way, the changes to helper-call 
paths would be limited to RVV.

Thanks,
Chen
> r~

