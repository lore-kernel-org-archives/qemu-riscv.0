Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9B2606A31D
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 11:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jQO/yW43
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJ7uj-0007F9-UW; Tue, 20 Oct 2026 07:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7ug-0007DQ-Gl
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 07:21:51 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7uZ-0003B9-Vw
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 07:21:48 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a1d75f2f11so21781845e9.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 04:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792495302; x=1793100102; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=2/y6WVmeqG1OPwYNPz9215YT6b6rVbd6ecgXKvSOZTs=;
 b=jQO/yW43EcYElqG/45L5JwELhTQYdPE+2z/OpDkIGIf4SJx1a+IaGLg/D6uCLNgFUl
 Wdq9DzFsqwstM6sAOQozRCB+2P+SdtK+ySvefYC7uzo+mGH+5uHmpWOXrCdbg3rvXxoe
 eaOu1pbOaG7Ysv06M25UP7kQ7e8JnpOG49tpQZC6rQEHBG9e1C1YGvsG6RhaL9hXVZ8u
 FsRgFvBnnQBHwjzN8EnVvOj2U16VYdOu6DB4XlKDppYFXn2hKYJ0RsT2E25s9Gxx61Eu
 yrZOf/F+iNvMdixMe73wcQIqzqiAwXRROlATYkwEZHv16zuTAboV2huBsVWJO9XdW/eE
 bFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792495302; x=1793100102;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=2/y6WVmeqG1OPwYNPz9215YT6b6rVbd6ecgXKvSOZTs=;
 b=d47Lz0UQB1HuXKew1GD8JKRMFwu798mzjwT0JrzEI8OHmzeeDtDlsRMxdtxbeuPKd9
 KmYc4aeoA1y0rNgeHTSyfhObAgfgPf3sDVP00lnEFF6UvtkKFNPfTeSo+N/cwoMp2lph
 YlvRuPgAG1iNiWIkvd6zuMEO/abHNydc+Yq6g/sb2pieAjUUAocGuwjo6N9G+tB5x9fo
 TuD8nczK13Wi26uYQrWNJ4lkUlUqDXxC/h2Yugn+ui2aJhBIOdInQIGRsjFfCWngf8Jg
 SNsenRmSCkWfEb7EOK7P129Yd6uMJ5XMlkMktBp24qUlWHwDnxWxMB8S2XhXCF2EyoZE
 oVSA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxl5KdF7BRWD0Alxkj9fdGO7uKNlPAusak3NSpOozw9xexyDZpkTRzo0ee1mbEy37nKu9VtZiBawFTQ@nongnu.org
X-Gm-Message-State: AFq9FYIykMiQTIbHKLK52D2H8nB4Iu466QnbUVgwp64H9cUHohU87ZO2
 cf3RALxlCsgpdujvzwxnD1hmDo+Xz2wOAxKlhk/tNvijIChCjR0w88yciQU2my+XMOs=
X-Gm-Gg: AYBFou14chwGpNU+WjOzvJVYQ2b7G675c2cEtDXk3fnLE8yyP2ZoGu3F9Rf3tVz/JME
 p3z2cQWbomxos0d7nvqkv837fsNUVICjjvrn/Z/Kb9hpPm2PgvihqGPc3bHkTQvCp9o6hHvuBm9
 /CkwPh0JDkotFEuu8xySKY/YHBNmjbLRsU+ooSWsCsYjAKoJuYPSVuMtL54NFf2la2PM83aIfTQ
 RbvWw+pgHunQAmDczFBHKXRotCjW92RHVgpBgqpGCzmtKmkEUeT0vuOOx7E76sY8hNYM4QKMQht
 fG7C5wDAJ6HoIklzwDtEwmWaA9NtHmbELtiByhSeXLc+Tv/dWknq2wpcaMq1CWMii7mfGRCtg8g
 yG+5JYUPOmhoSerFe4NpNmpH1Dar0padDIyivotBCvCDDmyELNBCCbaTkuyhmUmifs+uI7L+dWk
 fMXMIInI9jPA3F4k8DKZ4JOJdaaoTApafKGCKpuGXoLLXMqmIGFOEPbIBmIUk/mjV9w8HSIQ==
X-Received: by 2002:a05:600c:c166:b0:4a1:f736:79f3 with SMTP id
 5b1f17b1804b1-4a1f7367b83mr24851065e9.5.1792495302093; 
 Tue, 20 Oct 2026 04:21:42 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f8016c93sm29458585e9.5.2026.10.20.04.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 04:21:41 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7919C5F8DC;
 Tue, 20 Oct 2026 12:21:40 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bibo Mao <maobibo@loongson.cn>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Daniel Henrique Barboza
 <daniel.barboza@oss.qualcomm.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,  Song Gao <17746591750@163.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,  David Hildenbrand
 <david@kernel.org>,  Bernhard Beschow <shentey@gmail.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Nicholas Piggin <npiggin@gmail.com>,  Paul Durrant
 <paul@xen.org>,  =?utf-8?Q?Bj=C3=B6rn?= Walk <bwalk@linux.ibm.com>,  Jiaxun
 Yang <jiaxun.yang@flygoat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-s390x@nongnu.org,  David Woodhouse <dwmw2@infradead.org>,  Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>,  qemu-ppc@nongnu.org,  Marcelo
 Tosatti <mtosatti@redhat.com>,  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
 linux-edac@vger.kernel.org,  Glenn Miles <milesg@linux.ibm.com>,  Chao
 Liu <chao.liu@processmission.com>,  Cornelia Huck <cohuck@redhat.com>,
 Gautam Menghani <gautam@linux.ibm.com>,  Xianglai Li
 <lixianglai@loongson.cn>,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Chinmay Rath <rathc@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Matthew Rosato
 <mjrosato@linux.ibm.com>,  Amit Machhiwal <amachhiw@linux.ibm.com>,  Zhao
 Liu <zhao1.liu@intel.com>,  Weiwei Li <liwei1518@gmail.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>,  qemu-riscv@nongnu.org
Subject: Re: [PATCH 00/23] kvm: introduce KVMCPUOps
In-Reply-To: <20261020104320.3686723-1-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Tue, 20 Oct 2026 11:42:54 +0100")
References: <20261020104320.3686723-1-alex.bennee@linaro.org>
User-Agent: mu4e 1.14.4; emacs 30.1
Date: Tue, 20 Oct 2026 12:21:40 +0100
Message-ID: <87se2039dn.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> There is a world coming where we can have a KVM interface which
> supports multiple architectures. The old style approach of using
> linking to resolve per arch kvm_arch_foo handlers won't scale and is
> also slightly antithetical to the flexible not-quite object orientated
> way we do things in QEMU.

In case it's not obvious I intended the prefix to be RFC as it needs
discussion ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

