Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DDDEEB59B
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 12:00:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1soiUg-00020s-ON; Thu, 12 Sep 2024 08:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1soiTu-0001kq-9d
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 07:59:27 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1soiTo-00044r-Qq
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 07:59:26 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42cb7a2e4d6so7335605e9.0
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2024 04:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726142359; x=1726747159; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S9hH4zorKUC2orkfwALmr2q6s1FZ/UxiA+b+T0QKDfM=;
 b=haFrBfSftilxfimz3bMpDd/dPSBYazDqKxtZH2iK6pynOZk+SKyyJ5xGlT/VtD/B4v
 0RyaZgEAjM/V5kL6qrfwhGk4YsdJMJ/jAE87RsJjV4idMuFutbEK3c8fS9c4/GW6N4FI
 LzHMAV+GSAz8z0y9IwK2TNkHLRdZmdgQIkY5Rk/ZzYZaXruMcoB8iubYilLEhiJ1VoMA
 QWKuOeWia95azOA9GLNZT6Fi4yW52H+CqCdBopoNwZLe6SlGnM0ZvJTvwnzfel/PoTbc
 atGwJJMIG5wkyUjZbblASHHIETFeo90/qDv19rsYFmhTjq+NjNAOi6Z54chRh7hO4ok9
 DGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726142359; x=1726747159;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S9hH4zorKUC2orkfwALmr2q6s1FZ/UxiA+b+T0QKDfM=;
 b=fen579ZCOXaU6KWPIoBKjzLru0vnA2JzATQahBzRABhKdo9lPjMrn9v3LDOEMNYGfW
 y6eVEMo+TissIunIxxW3mQSvbIoQ/UvLhA+p4E632/zw73/XafqX6k3+V1fVA9h30NIv
 Jw126PeRnmQtl55pHfyUW8pSqtHU0mF58Cy2wgI5jrHyZD9iMb/hkcdgyFDu6QVahOFX
 SGrdVn8DQoEGlAwmyr04mGlrTUeXF5tX+c0Kokmzqx3TfnT6p2qADym9I1rdglZXZTqe
 J40fK7bJA0EMoIBt0iQ31N9hnhZMvkZ1Si4SCAoTzTvBiW5JCDoqWqn7tPJRDILo+trO
 VWIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtEE10QaN8wPfMnCS3ZWZWvk+75NHOZDrJAbyW6URD2lle0Uko/0pQMTZWwC6aL8S7D1+ExO1ZPcVI@nongnu.org
X-Gm-Message-State: AOJu0YynRnE2tI5Mqn1f/bU3QI2zu4U4Wy9MkSpLOkJ5kjTiG43aFUMv
 dBOvQFiATSxDVn3rDAJD3e1W0WxerYmQVgah96oYs7Mk3IrKwE4uuhc8/64mTO4=
X-Google-Smtp-Source: AGHT+IHdMYpvkErKC3W9i3z+Ft8XhpOoUilHTYrpJoqTJq/qhlwtnn61XatlsIjXjk2IjSojx5FOxQ==
X-Received: by 2002:a05:600c:1c28:b0:42c:ba1f:5452 with SMTP id
 5b1f17b1804b1-42cdb57c022mr22778035e9.25.1726142358622; 
 Thu, 12 Sep 2024 04:59:18 -0700 (PDT)
Received: from [192.168.1.102] ([176.176.161.148])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb44887sm171920365e9.23.2024.09.12.04.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 04:59:18 -0700 (PDT)
Message-ID: <a0608783-d6d8-4ccc-a431-5fc1e96e0021@linaro.org>
Date: Thu, 12 Sep 2024 13:59:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/48] include/hw/s390x: replace assert(false) with
 g_assert_not_reached()
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>, WANG Xuerui <git@xen0n.name>,
 Halil Pasic <pasic@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Michael Rolnik <mrolnik@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Corey Minyard <minyard@acm.org>,
 Keith Busch <kbusch@kernel.org>, Thomas Huth <thuth@redhat.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jesper Devantier <foss@defmacro.it>,
 Hyman Huang <yong.huang@smartx.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-riscv@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, kvm@vger.kernel.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Hanna Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Helge Deller <deller@gmx.de>, Peter Xu <peterx@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Eric Farman <farman@linux.ibm.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, qemu-block@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <fam@euphon.net>,
 Weiwei Li <liwei1518@gmail.com>, Markus Armbruster <armbru@redhat.com>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
 <20240912073921.453203-15-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240912073921.453203-15-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 12/9/24 09:38, Pierrick Bouvier wrote:
> This patch is part of a series that moves towards a consistent use of
> g_assert_not_reached() rather than an ad hoc mix of different
> assertion mechanisms.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/hw/s390x/cpu-topology.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

We usually don't precise "include/" in patch subject:
we treat include/FOO as part of FOO area.

