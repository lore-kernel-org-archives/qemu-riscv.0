Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305CCC3DA5D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 12:11:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sVrsI-0004qd-Ma; Mon, 22 Jul 2024 08:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVrs8-0004LZ-N0
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2024 08:10:33 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVrs0-00009v-AT
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2024 08:10:28 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5854ac817afso2545562a12.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Jul 2024 05:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721650222; x=1722255022; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3i5WWdcUMIgWDsmljU5u1tGWc4zOBYscJlhCvi739/Q=;
 b=fq5yl5dyHgGryEztP6Izi7K1jB/YErBs3MdcZICtrY80fBFCAaFNWF0kWko37TZwPh
 CnPtW3fmh3IVbec3GtsV6hTRcd3U8OWwrjimQA6vI7JbvDOFhig/tipHDOG+MMxqrA7M
 KcMuAMzUDW6ZprepQb3Qbhm9U/iUM3SixE3jWw+qiwzpyZ2biLNhC+/lkbMH5lkE0ox0
 gYvntXewKEWDut2TbgypFD7JdCA9cvS3Us9rloZat6ckVTC4NrCbhDR81ETR7u0Pbss9
 5YOO+8zyXS97CQmLzdW9yzEGVCvCxU0K/3Kd8q6RP1muzeFkQ6uDUF3TFozPsTWYHQTl
 xwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721650222; x=1722255022;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3i5WWdcUMIgWDsmljU5u1tGWc4zOBYscJlhCvi739/Q=;
 b=ojiOiZ0U2+0ZRV1WkNjCJoaQLu/oItNOkmvXAXhYC1gs74MZG78eVeigc9A9z6XM56
 tmcG3PFOnvbX4DIef7fW0mm7hULBz9FC/tqVA2/opkj/+AOdSwL70oRoaLjZfXF9+YTB
 HqKQLuwVnjT0is1vbIwVKSZaFqWFgYEr6x1A7x5m2rcC6HFoO2jX1scFhgv855CeM02L
 yjsjcdwTqtp8Q3qjBo2GF6kQrWaiIAHEKlDULaHiOf2Z2f+Zb9K5953ROVSv4Ml3iimP
 t17fZwre+XEoOQhKKHsyuJ0jhPYzDtsm3jfyzoZlWkGOvt4iXDq5InP9KGxQqn+5D3AZ
 comQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVMK7p5BrvLhLqqZstawKZYC6bTa7+89Gh1vFIKGE9QbYZclWPJlXCQ3XHLLaUmkhigI0YPz/t023dK6Pn1XB2QoOht3s=
X-Gm-Message-State: AOJu0YwxMDwUMDL47h/CzKnOPGhIlQdan0qwwU6aiA1ijZMsMLcm+Dg5
 nx26xvK3W0L3+EpqCiASSO1fv2DAEzqanng6sGcT9rdCxD4BA+wUBIeZe5xbHWVCC3zb2ygEQWF
 2nDsga8xb+zgfnUidpwkB0kBYPMj0ikJqrTRiaA==
X-Google-Smtp-Source: AGHT+IF0pmVYIzr30q18OPohaxDLGBKrN+XoVSfgomoIDw8e9bzS2x07ww6eZ974H1ODYxmlRv/OAevb4lOv7QC938U=
X-Received: by 2002:a50:9e66:0:b0:5a2:f154:95f4 with SMTP id
 4fb4d7f45d1cf-5a479b7295cmr3628146a12.22.1721650222506; Mon, 22 Jul 2024
 05:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
 <20240719010707.1319675-11-richard.henderson@linaro.org>
In-Reply-To: <20240719010707.1319675-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jul 2024 13:10:11 +0100
Message-ID: <CAFEAcA8yoQuQCOfnZCd4N0Uzm3RUwDqbDtyBA_164bJMVxRDsQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/12] target/s390x: Use user_or_likely in
 access_memmove
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Fri, 19 Jul 2024 at 02:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Invert the conditional, indent the block, and use the macro
> that expands to true for user-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/mem_helper.c | 54 +++++++++++++++++------------------
>  1 file changed, 26 insertions(+), 28 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

