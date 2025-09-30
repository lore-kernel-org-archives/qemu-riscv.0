Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4C5CCA46F
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 08:29:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3Vhx-0008MB-Ri; Tue, 30 Sep 2025 04:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1v3Vhk-0008C9-Vc
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 04:27:25 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1v3VhX-0002cX-Vn
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 04:27:22 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-b551b040930so3782497a12.2
 for <qemu-riscv@nongnu.org>; Tue, 30 Sep 2025 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759220815; x=1759825615; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0LNTdP/W0tNETzznAtplZaQ+bhPZSQ4LzCoij245COE=;
 b=lr9t9MmlHg1pycPVbT0VbEn7lCgXfZ9+JPULaqCuRGYG3pK2rLGqq+jyzk8JvEC6W2
 Mhj6iErVswyqylGDkA3o/dYZ5pe9JAJ4bgrmWsHuJW2rz1NL0zE25k/nZOXH8rXmnQLk
 ciwsyRVyNjVGWYZT+eNd3jD474JbJqKAs92otUlDCWCtV8eF2yox2lr/epmfPlObFDhA
 nBP9UEcgUjamNuYefBz6Gb6UQWp7nhE550ikTabBhcFCWmy1l0UnV1xnCJaAXZM8NvbV
 FN2giqX9reiRwALfO1Ty+dNTc0yVzMc99qtHuPCUWlqWO730DIDfrSsep04P9Ke58dFb
 u9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759220815; x=1759825615;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0LNTdP/W0tNETzznAtplZaQ+bhPZSQ4LzCoij245COE=;
 b=FjDSk4wzflQZE79mdPCWHoFPGh31mSZ4aQDK6zLjE1ROjM5sqFiriGgkYcYHn4TxqF
 vF8s32CoDPmWvcfM3xC6/uz0OmAJeslKRt/trvoG6eKACD7kao+ehpStN46/8n/jjFXY
 lhI49560cSWwz1hESk4NQDtZj+Kjc9w7ErKs17Muea1SioRdahzKg9mBzUnA7XGiwLvm
 7t35BJplbFu1z7ZV9RgWMhXG7IJkNwAwSjayMJgdbYeKwX9Dgcnmw2o8fFDIz4GupgjT
 GLfLW9tJtBI7f9Dr7wZ+SHnQhOsibQ8BFqO2KRosnv50+mE2FL5jBUcZA/uuGfWEoGfo
 ZF9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw5Zc9Nf7a7PNn4c+x0N6mc0nP65UklfEiOyqtKuYuLnYOcGKaQJ8jpXrkswrnVrNDEoMtmq6HYf7b@nongnu.org
X-Gm-Message-State: AOJu0YwmHNIE+Wb3hkce+NaTW26kcoUkp62EY4fu2PXeJhXe2JBAyt/m
 B58YTrYZoRMaQzWdt8crahHnmowxL942Pub4uZ3BJfKSBUuCUiQNrXurhS5ULCCC2grj8XyJ4hp
 RcbhtcPXaP4V6yrcR28vTAp4mXYE+/50=
X-Gm-Gg: ASbGncveBaGbbQYRrkwpycJdyInRrgtz3fwA1UxSq4m/anHvHHPqi00dbYEvc5I5gKh
 aSzuwI4XgYhKWJ49nHeA188j/iIXdEKxIsek7qdX86lEFOk23j2l0eRzLF/ogkdprQZG9SYXwHU
 8w6+E5jrSP10Sp80V6+sSInIA7vzOl33Zo2pCgLW4YBzD7MxovlyHjsROxAoKGEFVStMdNatB9f
 tx+MJX0RBB4EK6waVm2/SuA3R7RaB+2EAThTrtQukXWCyXORuceI6sBJZ0a
X-Google-Smtp-Source: AGHT+IEMt0iYeVZJIWJjd7IGAp2dKKy4AHmDDeWo2l/e1R0qhw9u1GtnblAWPVBswIzwPmB87ng/d0auMno6CWc6/Js=
X-Received: by 2002:a17:90b:3ccd:b0:30a:4874:5397 with SMTP id
 98e67ed59e1d1-3342a24d0camr19521105a91.9.1759220814783; Tue, 30 Sep 2025
 01:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756724464.git.ktokunaga.mail@gmail.com>
 <ba60c570-fff0-4ab8-b3bc-d191663d2912@linaro.org>
In-Reply-To: <ba60c570-fff0-4ab8-b3bc-d191663d2912@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Tue, 30 Sep 2025 17:26:42 +0900
X-Gm-Features: AS18NWCjjxIHQvMmmukI1NEOUr46E_NLwrncNl350eI0CPjg-mhAw1-oVcOVRBI
Message-ID: <CAEDrbUYAAbF5g4-HEvqDWZyycPzZQCJvqasJ355RkLOnfm0R3A@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] wasm: Add Wasm TCG backend based on wasm64
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>, 
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bf28cc0640008314"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000bf28cc0640008314
Content-Type: text/plain; charset="UTF-8"

Hi Pierrick,

Thank you for testing this patch.

> * /builddeps/target/include/ffi.h:430:6: error: 'FFI_NATIVE_RAW_API' is
> not defined, evaluates to 0 [-Werror,-Wundef]
> * various "format specifies type 'long long' but the argument has type
> 'long' [-Werror,-Wformat]"

On my side and also on the GitLab CI, these appear only as warnings and the
build completes without errors[1]. I'm curious why -Werror is being
triggered in your build. Have you applied additional configurations that
enabled -Werror?

[1] https://gitlab.com/ktock/qemu/-/jobs/11544442966#L7016

Regards,
Kohei

--000000000000bf28cc0640008314
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Pierrick,<br><br>Thank you for testing=
 this patch.<br><br>&gt; * /builddeps/target/include/ffi.h:430:6: error: &#=
39;FFI_NATIVE_RAW_API&#39; is<br>&gt; not defined, evaluates to 0 [-Werror,=
-Wundef]<br>&gt; * various &quot;format specifies type &#39;long long&#39; =
but the argument has type<br>&gt; &#39;long&#39; [-Werror,-Wformat]&quot;<b=
r><br>On my side and also on the GitLab CI, these appear only as warnings a=
nd the<br>build completes without errors[1]. I&#39;m curious why -Werror is=
 being<br>triggered in your build. Have you applied additional configuratio=
ns that<br>enabled -Werror?<br><br>[1] <a href=3D"https://gitlab.com/ktock/=
qemu/-/jobs/11544442966#L7016">https://gitlab.com/ktock/qemu/-/jobs/1154444=
2966#L7016</a></div><div dir=3D"ltr"><br></div><div>Regards,</div><div>Kohe=
i</div></div>

--000000000000bf28cc0640008314--

