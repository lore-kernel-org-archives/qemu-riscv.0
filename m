Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C830CD98F0
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 04:16:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbsYL-0001rH-9m; Tue, 23 Jun 2026 00:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wbsYF-0001qo-L8
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 00:15:55 -0400
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wbsYD-00054Z-68
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 00:15:54 -0400
Received: by mail-dy1-x1342.google.com with SMTP id
 5a478bee46e88-304f590dd91so5953875eec.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782188152; x=1782792952; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MLGLvtRnVcxBxBbGHEo0MK87nSnrcvBtXArVRINExhY=;
 b=LhnEHTQq+yixLfphBVK8xOzR12AaCjF/b7UOy7kagBOvry9VshuK7UQHNX+QPxkNJb
 MggzuAJgH+TKcSIZLk2isy86ti+XTBMRyNGwgntGlJCzglLDA1qcoHsHVY5I/N4yDuVd
 vywbdYTT2s3uhiDRDW6WR+6a1yVnGFRmK84FFb2DJrQjhk92JOZLKoAaJVDAnaYt7Zf4
 XD/iMgKACIc5kl9KguRcRBN7AYkuVpEnARpgDogY475a5ZWIEOx3qxc6+o1+Rs0rUW8K
 ipAlB9v9PwKPmzlcS0DTwXIQZQzP7UoEhKUzirhzsJAKbvUvUAgheKaGKe2T68MYYX4J
 Ob6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782188152; x=1782792952;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MLGLvtRnVcxBxBbGHEo0MK87nSnrcvBtXArVRINExhY=;
 b=sHrtvDWPpjuWBlXv0xSJXFzKP5pFh5VhOFhE3c43+EjGcCW7prjLN/fhHEOMe0vGkX
 WCC+0rrBBtKBahy8ICXx7VHoEgX1wTZ9X+nq3XX92XuKJDWDUsi6JftmcTYd6xiSx8lt
 Pb1OLTusgLpuOyRoXN/Z1ZBAXN+YmjNnkffMUAJWMqd73EG++xOt0wQuWJdShkktTsF8
 vWxP0PM84SHoRtCV58YeVNjytzySIkAw60TFp3VICerjYCj+ixa/2in1zIzz5vZoLwdU
 hQDjcxAGLEuB8Ha29Oo5X/TK5jXGj8uEPRHLelO3+8m38XamqQnNT5hNVyHZ6M9wXSrZ
 PZ7Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RodrvuBs7tZYPcg2JX0b0EKHO9LKP5kMq3EUiQxZ/6qsFeMPhqEeHpY/hkd88kjCCY38glz5oj2gaJA@nongnu.org
X-Gm-Message-State: AOJu0Yx+jHqzTcoGpS04R3lnEv2fI9rhe2dZbbz5BuNyQXrB6Z1hZN20
 dC1WEm426NDHpPt1UcPShWE9jEDzTFd8YNygi9RPR5gQrzdfa8TsItfQ
X-Gm-Gg: AfdE7clbFS7BVA1a4m2ON3b35tQ6jOMZkIsuNnQ8NUeICDT3cnLj8Sw9Z7mNLZz3MIE
 sYFonTiNuJxyX9bx5M4xSmOW1ZmfnKgBPEcGJQcwbGkKDt0XIpmcH6CcLNBh5xY5vh+FdCPXan/
 b85Likd+j/RE8jRo3JpF8lHkc+7TNZHXtndPHEnUvz/k6/zUZH2rmu3kl0AABRqcFqSB/Y1KUzJ
 8v1rqYxkRCAEbirjNiYftp+0ZD8YpVZ+dM+PpKgf9XKDt+9dhPdUYNWytfEtlI1ks4OtZDRaP5g
 hW16EzWiqMYFeCvlEf2oEfaGEZHLHfIA7YCiW4tNkSPXIpfwDXgxsOkjZ5v/Std04xGeqyzOUK5
 ntAWoNFN2+kUBGbd+5zzzRFyQGVj8BpSC99pyNb0WHqfzsUvO+mZm7J7wxMdeIPf/ABhYkPa6/A
 w/NXqt7lTt204YlOOhdmookUonk+s0T5BX/3jhiZyDRHRof90U
X-Received: by 2002:a05:7301:9c90:b0:304:e2a5:689c with SMTP id
 5a478bee46e88-30c07001961mr12983331eec.21.1782188151730; 
 Mon, 22 Jun 2026 21:15:51 -0700 (PDT)
Received: from localhost ([64.186.250.142]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c1ba91120sm13506241eec.13.2026.06.22.21.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 21:15:50 -0700 (PDT)
Date: Tue, 23 Jun 2026 12:15:47 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 4/5] hw/riscv/virt.c: change 'plic' nodename to
 'interrupt-controller'
Message-ID: <ajoIYVXCylVjKQGK@ChaodeMacBook-Pro.local>
References: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
 <20260616235939.1358663-5-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616235939.1358663-5-daniel.barboza@oss.qualcomm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1342;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-dy1-x1342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, Jun 16, 2026 at 08:59:38PM +0800, Daniel Henrique Barboza wrote:
> We're still using "/soc/plic@..." as FDT nodename in virt.c.  This is
> not the right nodename per the DT docs:
> 
> https://www.kernel.org/doc/Documentation/devicetree/bindings/interrupt-controller/sifive%2Cplic-1.0.0.txt
> 
> The nodename must be 'interrupt-controller@...' since the node inherits
> the 'interrupt-controller' type.  In fact, ever since at least the 2020
> Linux kernel commit c825a081c169cc7f ("dt-bindings: riscv: convert plic
> bindings to json-schema") the correct nodename has been
> 'interrupt-controller' for the sifive PLIC controller.
> 
> There's no deprecation needed for bug fixes so we're just fixing the
> name.  This was the policy we dud when fixing the aplic [1] and the
> imsic [2] nodenames to 'interrupt-controller@...' as well.
> 
> The sifive_u PLIC FDT already uses the correct nodename for PLIC, so it
> is safe to assume that available SW is already aware of the correct
> nodename and this change won't affect well-behaved SW.
> 
> [1] commit 29390fd ("hw/riscv/virt.c: rename aplic nodename to 'interrupt-controller'")
> [2] commit e8ad581 ("hw/riscv/virt.c: change imsic nodename to 'interrupt-controller'")
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>

Thanks,
Chao

> ---
>  hw/riscv/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 33775a61fd..fa464e644f 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -335,7 +335,7 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>      plic_phandles[socket] = (*phandle)++;
>      plic_addr = s->memmap[VIRT_PLIC].base +
>                  (s->memmap[VIRT_PLIC].size * socket);
> -    plic_name = g_strdup_printf("/soc/plic@%lx", plic_addr);
> +    plic_name = g_strdup_printf("/soc/interrupt-controller@%lx", plic_addr);
>      qemu_fdt_add_subnode(ms->fdt, plic_name);
>      qemu_fdt_setprop_cell(ms->fdt, plic_name,
>          "#interrupt-cells", FDT_PLIC_INT_CELLS);
> -- 
> 2.43.0
> 

