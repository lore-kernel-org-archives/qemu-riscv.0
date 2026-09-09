Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE774C79F8C
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 07:33:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4Cnl-0007UW-IC; Wed, 09 Sep 2026 03:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <readqemu@gmail.com>)
 id 1x4Cnk-0007U6-NI
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 03:33:00 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <readqemu@gmail.com>)
 id 1x4Cnj-0004ON-Af
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 03:33:00 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6a60f0dbeccso7319107a12.0
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 00:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788939177; cv=none;
 d=google.com; s=arc-20260327;
 b=DwbcB7cEf3PSnnFI6mpBayJsfeVgQ3NSi0N28oGZuNrwYNLWIE+2iH/1s/uimUSSIw
 8ooRPmdLtqeQf2I1xackT+DzhMjkQSzgJO74uN+MOIavnBZ0qR/BjOHU+mqhjY7r8/U/
 9VxL9JBV0rmtJqDoQwuRy0z/fgCHsLGk3AQ5lGjmqNHzWXuCwIl1vXXrIrKaNV4DCfi8
 gocitEM7H0i40h6Gj2FHm8ITsS9N84hP7+bshA0Z8sdtbxlMUXItSigwMM7Gc6RVEyxt
 XwAw+oUjxww/4oCvcbtReX0Kcjy99GdlPKnFdNTa2ZbMlT7LHLPpeUeznrcuOxmYxM/J
 dNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=L1lp+a6grUq9QWrKs7p5Wo+a4nCUMqQfkPzxpyIiF+8=;
 fh=NR3nEGYjcJ9oIS3xUtdkm/GXNX9ypWw7PiBlMYWw17s=;
 b=nViT0/+9wcxxyleMF1cR7Zl+ZBtgHDY8ZKJ/WpTdQ+r/UKyeaXI0LRA/APiIRG/+0Q
 orIxZXSmpOQprmn2GcNoNBt+4a9aUbAzZ6toDXSRmrmb7cpHxbjo8cTeuUB5Gd3PmnwS
 CQIjjG/VzZoj9LQBvdCnIdDhsYr5j43CrZoWiZfdjrBbZEMJRgNR/F86zufDRG8Y+bVR
 azsLWVm+dc0dve3cekncmVMfWb8FpspUz6qf+hmmGP9AgqkAfGUS3whSpmfNsDAecDP2
 rGWSXx2jHyOf4R+0TmmHjg1B1aI8RvFfIHORwP4VY2T2c71K09EZwj9L1OfamIeF7QJI
 bWkA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788939177; x=1789543977; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=L1lp+a6grUq9QWrKs7p5Wo+a4nCUMqQfkPzxpyIiF+8=;
 b=QktBvQMYFMK3aZpmaDVQjtGbd8JeqTqb6SROYp476j2eY2BmFEKy8ho1qs9R4sXiVd
 S1KSHJpJc55TRjoBAM9gSG2HDOY1eZcycWA/o8QnALi4pbdTuTCkiYFhuoPvAiE3DyD/
 TsQ6w4ADNv60xgcOXRjibnfu+lhuEVVcY5+7Aa/y7hze/zg/QYo2Kjp4hRilUegH2TRG
 VsemNhRflfZDi1BI/6mYXhkZ06poNezDk4/il8/cdggnDEexjvof7nFAgtWDUip8lD7f
 dJxszPamCxTB38UxcowujRz7F1YAD3zPPuPcW23HR6BfaU4nNuThFOfo5lgPaha99G1H
 axIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788939177; x=1789543977;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=L1lp+a6grUq9QWrKs7p5Wo+a4nCUMqQfkPzxpyIiF+8=;
 b=cEwXj2OFv6JJ6qk2vHWV/LKRvYzpsDK4h1Zr/qK8Q6rBoZSGh9DPTSPBlaeTvsD8tk
 ew8SvibYbwiURSXxk9fHBekyDYIT+046GAeevqpBgIP3frzaGRzAEbDo106Zgromwvr9
 yruo2PV9AnhSIfhZ8wLN/HWiI398GhnjOMUysAtKrN3L2h/pwd8OF2dRv2v4EfD6YWZ4
 ZgKHcbz54hVDDcDsb+KPKOWyLEzL324gjNMkVavAnZ9G/X1rqSA3UmmjKalCzVfZyVSC
 7Ye8RReFTvgA5Iq+v4JfUvukYskD+PdkH2uHjP6ufb7R/57E0YUkQ7AVJ7Z2qdj9j9y4
 Y5XA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzNyRvkO6zJj6/bE2FZ7HUZWtFgutCMS5R6GYDdyn1MpS+WfoUUKvKwZBm85Lq5/2FV6cMnw0iu0RyV@nongnu.org
X-Gm-Message-State: AFuF++nKxVkVEw53c5M4KZ4qIqNVGYXhSONeEe+yYIJ6iBzmVXCNSyzY
 NaZKWcg6wTknYiZhO3O63wwBsfjyx9HvlqNHp7O5UrgYnMIrRRiueA6UoqBWNVgYNXJAMk6P2Xe
 jGxJf0gxXhACd0nyBI29TRmpYSbXozdY=
X-Gm-Gg: AYBFou3cd5VNIcJpCnYz3IzPyRPnAUZ9l1xJKfRxDFDsMra05HlGfG0w8+wCpIQk3Hw
 4brZsEfzhlK/qXKSytnUNqxW0O2jNYvi2S8Z+Ttmqk96ig3TCWhcB6tIVt3ei8k66vQQt1LVFMm
 K9L0KWse/q//KkIKnbCq8zI/gI7cld9lS813VmP4jsevxlTV2l1uWvaNxA7SL+11pJnIjsd0F60
 qwXOXY5HTGD5XPtsEBGuIz8VUxiSTbyh0YE6UHNX3EiuGdXF/Tzn9CH63ssedTq45k+6jUnLx4k
 +Hr9lQqvAcG2RKZPmYLdGc/iJZzmQtzYE8u5sUJyUYr6k0/6Wy8Ul81eMg==
X-Received: by 2002:a05:6402:13d2:b0:698:e614:e4bf with SMTP id
 4fb4d7f45d1cf-6a7e8cb530amr11447107a12.0.1788939177276; Wed, 09 Sep 2026
 00:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260723200325.24969-1-zhiwei_liu@linux.alibaba.com>
 <20260723200325.24969-2-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20260723200325.24969-2-zhiwei_liu@linux.alibaba.com>
From: Qemu <readqemu@gmail.com>
Date: Wed, 9 Sep 2026 15:32:44 +0800
X-Gm-Features: AcwNN1UthEaXlNHv0uiJDAv2G2v1Z8J-UPbzgvVms4BfFSJ9r3khhaCgEsqZf7g
Message-ID: <CAMXXpfZoEHGRXTMzWtmtkBcnp+YO9O=sJqV0M4oyUYKvoPs7hg@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] target/riscv: Add basic definitions and CSRs for
 SMMPT
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 daniel.barboza@oss.qualcomm.com, chao.liu.zevorn@gmail.com, 
 liwei1518@gmail.com, qemu-riscv@nongnu.org, rahul@summations.net, 
 xiangyi.zeng@linux.alibaba.com, cxx194832@alibaba-inc.com, 
 Huang Tao <eric.huang@linux.alibaba.com>,
 TANG Tiancheng <lyndra@linux.alibaba.com>
Content-Type: multipart/alternative; boundary="0000000000002fb934065b07dce6"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=readqemu@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000002fb934065b07dce6
Content-Type: text/plain; charset="UTF-8"

> This provides the necessary infrastructure for the core MPT logic and
> MMU integration that will follow.
>
> Co-authored-by: Huang Tao <eric.huang@linux.alibaba.com>
> Co-authored-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Jay Chang <jay.chang@sifive.com>

Thanks.

--0000000000002fb934065b07dce6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span class=3D"gmail-il">&gt; This provides the neces=
sary infrastructure for the core MPT logic and<br>&gt; MMU integration that=
 will follow.<br>&gt;=C2=A0<br>&gt; Co-authored-by: Huang Tao &lt;<a href=
=3D"mailto:eric.huang@linux.alibaba.com" target=3D"_blank">eric.huang@linux=
.alibaba.com</a>&gt;<br>&gt; Co-authored-by: TANG Tiancheng &lt;<a href=3D"=
mailto:lyndra@linux.alibaba.com" target=3D"_blank">lyndra@linux.alibaba.com=
</a>&gt;<br>&gt; Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu=
@linux.alibaba.com" target=3D"_blank">zhiwei_liu@linux.alibaba.com</a>&gt;<=
/span></div><div><span class=3D"gmail-il"><br></span></div><span class=3D"g=
mail-il">Reviewed</span>-by: Jay Chang &lt;<a href=3D"mailto:jay.chang@sifi=
ve.com">jay.chang@sifive.com</a>&gt;<div><br></div><div>Thanks.</div></div>

--0000000000002fb934065b07dce6--

