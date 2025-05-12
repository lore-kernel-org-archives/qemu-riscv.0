Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9B1C3ABBC
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 May 2025 08:48:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uEOp7-0002ZD-QD; Mon, 12 May 2025 04:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uEOo8-0002BA-EA
 for qemu-riscv@nongnu.org; Mon, 12 May 2025 04:46:45 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uEOo6-0002Gn-Nv
 for qemu-riscv@nongnu.org; Mon, 12 May 2025 04:46:44 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-7091d7244e8so37917667b3.3
 for <qemu-riscv@nongnu.org>; Mon, 12 May 2025 01:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747039601; x=1747644401; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N2NVw1vctpw4VdxjsSRvIp8qR1FQioY2MoaReGDEb+E=;
 b=SlILcrJlpky4Fd3J++a0HKZU6Pt+UlMS7x3gqtaJqgwRaoE6pdXB1WRGx6vFp0HfAr
 uBLCAP6TYTQynXGWILA+OATv4KqFCmlFnMcWDXrXpe2hjo7cj0S3W0TnSg/O+pQ7Dj4n
 zelPWu7wkoBwRxVWFGEx1ztlG5ytH/DO2ZXBA2sv1vhe+8jePIRuTPFwhozLThkZi4Q1
 fpi3Jjkcpvm+QUYKlqJuCgUbySmTzsZ9YVE41clhhZFkBln+KUcAMezswvmCOgp0UUd7
 nCFkjtfUPN2iyVxGg0JPrui+2vq5L3G9ZDWPVSmD43hidT65Ov7V9wPWAMVkyYY+gHee
 N2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747039601; x=1747644401;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N2NVw1vctpw4VdxjsSRvIp8qR1FQioY2MoaReGDEb+E=;
 b=cebXG5wRXGExa5qEzE4Ag5jkX7zPCovYRIKZmD/sdwU8CRfPSwJ5ye/Wx49Yro/sik
 CvMC5yb0hF3IDYZ/6w3WlFe3Dn/A8pPQTvQJ7BVacJRAqGzKUq3PXSRV5yZNiCp2aXJn
 kCxEMW8GnZYUGJzInbA9N3/dMQ1M4UdJHOqBBDIkSKJzFyYY4NziUTEjWQ0D79BX9vAY
 K9FhvcwNcboza3SNGcarvTfRlYZ0LnvjIuMai/wwgPYP3sdHeo/WYI2l7OIQ4i31ndRJ
 NJGrTcAndZTWkQyecXrCPkWKnDhtwu5/GVBwJQFmEimTS6yHk9TQsDrLKOmzVT0j2BVY
 Hs9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt54xrZCH8IFkIj6BKBHEem2cy6czVImpj9ewpnj6XuIT0wI2IJfyfutwkfUhDzJpsQyMpJI+VXw1D@nongnu.org
X-Gm-Message-State: AOJu0YxaB9TVEY6khQ54lKFgisROxfH1fU+xj3c6GIFtqgU/44r38M05
 l3q8vNzgRlp1Xoy7+tB2MjrNKfJ2shr+gsynmsxsV5ijxJwLlgJj7f+kGNXSUZO+DxGcgSFyk//
 FSwvE0IGSuXqBp4r1jfbMYFf9KwmC//eFEKUN7Q==
X-Gm-Gg: ASbGncvFbfwKgLqrtoEiFYxf59FMjgByEK3OlzGxrM0pyahd1tvjeA8PT9JDju3wPx7
 Le7r/Qh1+ARtDibEPpYBTGl3Au+TfeG8TBt3goV6R4xk6tOmHsyWqjIOgdBqSSSEO1c2+zmUtel
 sKwdoNuNKYBJVhLZOh6cMOnOWTqWmkDUnVLg==
X-Google-Smtp-Source: AGHT+IFm02z/RgZm6/IfSP9b2A9XxMjlo0wxyKw7bnZQK6m8s/qL+dHccy2NAQdA8QpgNSb5VC5Y3JZobjE8cEMedto=
X-Received: by 2002:a05:690c:610a:b0:702:5689:356e with SMTP id
 00721157ae682-70a3fa255f7mr147088147b3.12.1747039601406; Mon, 12 May 2025
 01:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-13-philmd@linaro.org>
 <23260c74-01ba-45bc-bf2f-b3e19c28ec8a@intel.com> <aB2vjuT07EuO6JSQ@intel.com>
 <2f526570-7ab0-479c-967c-b3f95f9f19e3@redhat.com>
In-Reply-To: <2f526570-7ab0-479c-967c-b3f95f9f19e3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 May 2025 09:46:30 +0100
X-Gm-Features: AX0GCFubIQGwUvsBeO1JqHfag2JXE624Dj7DHFCn6wFHtrkPbrfp4Ge8KnLAUwc
Message-ID: <CAFEAcA-kuHvxjuV_cMh-Px3C-k2Gd51jFqhwndO52vm++M_jAA@mail.gmail.com>
Subject: Re: How to mark internal properties (was: Re: [PATCH v4 12/27]
 target/i386/cpu: Remove CPUX86State::enable_cpuid_0xb field)
To: Thomas Huth <thuth@redhat.com>
Cc: Zhao Liu <zhao1.liu@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha <anisinha@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu=2D=2DDrif?= <clement.mathieu--drif@eviden.com>, 
 qemu-arm@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, 9 May 2025 at 11:04, Thomas Huth <thuth@redhat.com> wrote:
> Thanks for your clarifications, Zhao! But I think this shows again the
> problem that we have hit a couple of times in the past already: Properties
> are currently used for both, config knobs for the users and internal
> switches for configuration of the machine. We lack a proper way to say "this
> property is usable for the user" and "this property is meant for internal
> configuration only".
>
> I wonder whether we could maybe come up with a naming scheme to better
> distinguish the two sets, e.g. by using a prefix similar to the "x-" prefix
> for experimental properties? We could e.g. say that all properties starting
> with a "q-" are meant for QEMU-internal configuration only or something
> similar (and maybe even hide those from the default help output when running
> "-device xyz,help" ?)? Anybody any opinions or better ideas on this?

I think a q-prefix is potentially a bit clunky unless we also have
infrastructure to say eg DEFINE_INTERNAL_PROP_BOOL("foo", ...)
and have it auto-add the prefix, and to have the C APIs for
setting properties search for both "foo" and "q-foo" so you
don't have to write qdev_prop_set_bit(dev, "q-foo", ...).

thanks
-- PMM

