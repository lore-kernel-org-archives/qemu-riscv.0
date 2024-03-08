Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FCCC5475B
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 23:09:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rijLU-0007Nc-Us; Fri, 08 Mar 2024 18:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@cloud.com>)
 id 1rie7q-0005D2-LS
 for qemu-riscv@nongnu.org; Fri, 08 Mar 2024 12:35:18 -0500
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anthony.perard@cloud.com>)
 id 1rie7n-0007gl-W6
 for qemu-riscv@nongnu.org; Fri, 08 Mar 2024 12:35:18 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5a142375987so853895eaf.3
 for <qemu-riscv@nongnu.org>; Fri, 08 Mar 2024 09:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.com; s=cloud; t=1709919314; x=1710524114; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=42z1c6En4OMO73HSWbt9qhFCGOY4c7z3vfsZqA96K6s=;
 b=VIZAJVaFefLbQ8kIWlgZpDE7MATjid9pzWyPYK0rzJFLCfgi8YeIdyU4hJBLGrt5Jw
 TZ7sDwhsGm40qWC+PNQK8y7rKIIVnt8D0v0xlso3owM9eT9Zb1FICAyOceT/L3jfsEd2
 ppHMucwoTWyB9nLluM+lQK4rK89+AGOc/s1vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709919314; x=1710524114;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=42z1c6En4OMO73HSWbt9qhFCGOY4c7z3vfsZqA96K6s=;
 b=fjXnp9eOpa+u1TZ+v3yxNUh0HvqeJ3ewFTp6HIxHjEJioJ0f19bOGlRBgZ0zGsGG4m
 uKl4cRvqf/U07HQMKx84xB+duJC0aKqM4H5q9xLyngZmHKCPxCZuJ4Nua4iurhL/YY7s
 ABlS92Ezl+0tdH35FhuAp1MlMtYgmwDnARusmqOqLulkMnZIAaLVkdjgI7MnxQiSAzgi
 DXKJtUncxwcpS98lRih3E6NaPHf9kgqU51x1am850Wxu6ggDRS05NN7ep9n+AxPAiAWI
 ZNBkSF8GxU0erK0dih2cvZBqO1JlmYNva46bpXru/u7booUwhZO+q1ZGhihFJ40VEE03
 qYgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiZ2jPqrZlcbV5RwbSEvjpz82pClylnB8mDMGVO1HdWFUkz0TvU3rQhi0YG998U2szEH1bMHKO3gOOTjG75uH8zb58mi0=
X-Gm-Message-State: AOJu0YwuI8+rqH8RPhk2zTkSaNLTsTJaNWNcY58yHA9xjUm79I3lpybr
 6fY8fXwGcSNAFNhOTlAa65ZIFTVx4GJClq31fECMn8GakAl+7UzpTDogJ1v1Qv4=
X-Google-Smtp-Source: AGHT+IFP+iIn7ziPACo/W5ywuwt3jU9vKOJI+Md4melHw3m+IPRBayOOv3MnfyWInvHuBqQD34WXQg==
X-Received: by 2002:a05:6820:2227:b0:5a1:34cf:400c with SMTP id
 cj39-20020a056820222700b005a134cf400cmr12525786oob.9.1709919314653; 
 Fri, 08 Mar 2024 09:35:14 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z5-20020a05683020c500b006e12266433csm2248064otq.27.2024.03.08.09.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 09:35:14 -0800 (PST)
Date: Fri, 8 Mar 2024 17:35:08 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?iso-8859-1?Q?Fr=E9d=E9ric?= Barrat <fbarrat@linux.ibm.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, mzamazal@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Peter Maydell <peter.maydell@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/29] bulk: Access existing variables initialized to
 &S->F when available
Message-ID: <a495a2c8-0259-4a44-8ac4-9cb6052074b6@perard>
References: <20240129164514.73104-1-philmd@linaro.org>
 <20240129164514.73104-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129164514.73104-2-philmd@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=anthony.perard@cloud.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 08 Mar 2024 18:09:43 -0500
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

On Mon, Jan 29, 2024 at 05:44:43PM +0100, Philippe Mathieu-Daudé wrote:
> When a variable is initialized to &struct->field, use it
> in place. Rationale: while this makes the code more concise,
> this also helps static analyzers.
> 
> Mechanical change using the following Coccinelle spatch script:
> 
>  @@
>  type S, F;
>  identifier s, m, v;
>  @@
>       S *s;
>       ...
>       F *v = &s->m;
>       <+...
>  -    &s->m
>  +    v
>       ...+>
> 
> Inspired-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 36e6f93c37..10ddf6bc91 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -710,7 +710,7 @@ static void xen_pt_destroy(PCIDevice *d) {
>      uint8_t intx;
>      int rc;
>  
> -    if (machine_irq && !xen_host_pci_device_closed(&s->real_device)) {
> +    if (machine_irq && !xen_host_pci_device_closed(host_dev)) {
>          intx = xen_pt_pci_intx(s);
>          rc = xc_domain_unbind_pt_irq(xen_xc, xen_domid, machine_irq,
>                                       PT_IRQ_TYPE_PCI,
> @@ -759,8 +759,8 @@ static void xen_pt_destroy(PCIDevice *d) {
>          memory_listener_unregister(&s->io_listener);
>          s->listener_set = false;
>      }
> -    if (!xen_host_pci_device_closed(&s->real_device)) {
> -        xen_host_pci_device_put(&s->real_device);
> +    if (!xen_host_pci_device_closed(host_dev)) {
> +        xen_host_pci_device_put(host_dev);

For the Xen part:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

