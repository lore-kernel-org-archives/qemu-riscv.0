Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC67BCD98F0
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 04:14:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbsWf-0000sI-BW; Tue, 23 Jun 2026 00:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wbsWe-0000qa-8H
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 00:14:16 -0400
Received: from mail-dy1-x1344.google.com ([2607:f8b0:4864:20::1344])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wbsWc-0003Yp-M2
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 00:14:15 -0400
Received: by mail-dy1-x1344.google.com with SMTP id
 5a478bee46e88-30bf8b2bd20so9364950eec.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782188053; x=1782792853; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0NCyTmgt98g9cfB64qirJ5HXfyrMUQsWRBPptQ7TCKE=;
 b=Tbh2T8TYIOp/FHFA/1FGiD9k/oR6wtR0+Y+9fr5jpOicdA455NInVK+XvMm+KED7Sw
 qdq7T+WDFeWIwoL9Z5C+Sw93WPzt38emJVmPv/aNitnlx+D9Hh+c4TDoHjpGXiOdoziC
 /x9ge3vPC7c9LRcY6XcGVUSuevs7QZfeaTOwjsOBxl2e0zuRLGv5iw+8rNrOH8EwdOhw
 DE5v+Q/a24jNv4zzVZ5x2xMHbs0vmV1cbxUtlla5NnJB8qGWuKRu1bAjijtrqxRpMYP1
 1zPpKAJ3ETzmW0AZ/VQLWAo2YopfoVPPB3ZaMDhlVRghNOplyitJn8ZUdTBcOb+rbUIr
 8o2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782188053; x=1782792853;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0NCyTmgt98g9cfB64qirJ5HXfyrMUQsWRBPptQ7TCKE=;
 b=GxX1hyjrK++txXSdICRRPMGYULEHpUgZ1OSfVSBV4Xrzh1/lyCgJb1Sv008nfm703G
 ZIP8VKtphJfyXJWIVJHs+eS2SffszSyygXJQytL1qUtzrCSe9TqbpsnX+Ui1LZSd68Y2
 X7GS+rw0CVv657zMdBebP8FGE0ecl314ZqnCjxaXs3r5TdCwAxkKTVzjt/gHXYzmMFcJ
 8+CxJukySHo3koJY1gbVLzG0/U5H4ZyYf2Zc/+9fHsv7TP4wktZF3M6oNg5+pfU3QM/D
 Wv6Qxuk6QKoHEz6jzEuwK8d8ei4Bvv72imm44ptd4aD6pY7WANrn+9+NUC+IcVeV4x2W
 4dFw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqltbZdunlg/IANvUEzEZN+VsboeqRBaH62JiVuiip6LfstbHgYbO8LTcWDHp8eZ5oixd8mXLDLYwqV@nongnu.org
X-Gm-Message-State: AOJu0YwMdeRg8ViWhYBGf6uEXu1a00PH5geW9h7q1ztcopymetwAj9d0
 kjGGDrnSezaK2mbsOWIW8hBEoNmADYuoxSWS2SK9eeb3D5a5MHlSEI9D
X-Gm-Gg: AfdE7clHYhBQmGV4tfe7v9bFeo7D2nQsX+S7IRJg/ABeZiXmFW63P83NbHJtMzLbI6w
 sgLPt98prw8BmY1Ug4FLi262N1KzbalQhhe63lfFQbOJYJCDn1PmkISI8rO8LsxgtHzWs7kn/H9
 k+xDOfRli6HIY3MC86TTsmZ59c2//XoE8h/MEXNV0swwGxyII5x0c4ujlpFUY8eWaCLooP1ficf
 b2SWan2EWZALugxyMGF+e19clMHdbEXOKW+sZbn2ltGSLlSyjul/s+FDSISX1Uc7z/UFblQXhtL
 OJyENamWLhnc1S+0dVU8DzL3G494HNDaa3WQCVvvyOcHdc9Eg0ZhNg65cgiLh/dD+b3Ly8LeFSr
 cBFdhioeM6H9ijlWRoYlgll/BRxKCtZaGpphVW2Vp0ImW9AASdGhk9J9I5pcp9/op1yxrvasor1
 1+asOjdY0b5jqpGoD6pBmOPjWKCQSh3iPCyqvXCenk44iPqL7M
X-Received: by 2002:a05:7300:ac8a:b0:304:6d18:3646 with SMTP id
 5a478bee46e88-30c1d5955c6mr9388585eec.0.1782188052992; 
 Mon, 22 Jun 2026 21:14:12 -0700 (PDT)
Received: from localhost ([64.186.250.142]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c1bddfe34sm15430327eec.20.2026.06.22.21.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 21:14:12 -0700 (PDT)
Date: Tue, 23 Jun 2026 12:14:09 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 2/5] hw/riscv/sifive_u.c: use intc_phandle in plic creation
Message-ID: <ajoHzy3dYz6-cC0c@ChaodeMacBook-Pro.local>
References: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
 <20260616235939.1358663-3-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616235939.1358663-3-daniel.barboza@oss.qualcomm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1344;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-dy1-x1344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, Jun 16, 2026 at 08:59:36PM +0800, Daniel Henrique Barboza wrote:
> The info about intc_phandles for each CPU is already stored in the
> intc_phandles array.  We don't need to fetch them again using
> qemu_fdt_get_phandle().
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>

Thanks,
Chao
> ---
>  hw/riscv/sifive_u.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index fda9a09f06..b3468254f5 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -199,20 +199,16 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      plic_phandle = phandle++;
>      cells =  g_new0(uint32_t, ms->smp.cpus * 4 - 2);
>      for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
> -        nodename =
> -            g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
> -        uint32_t intc_phandle = qemu_fdt_get_phandle(fdt, nodename);
>          /* cpu 0 is the management hart that does not have S-mode */
>          if (cpu == 0) {
> -            cells[0] = cpu_to_be32(intc_phandle);
> +            cells[0] = cpu_to_be32(intc_phandles[cpu]);
>              cells[1] = cpu_to_be32(IRQ_M_EXT);
>          } else {
> -            cells[cpu * 4 - 2] = cpu_to_be32(intc_phandle);
> +            cells[cpu * 4 - 2] = cpu_to_be32(intc_phandles[cpu]);
>              cells[cpu * 4 - 1] = cpu_to_be32(IRQ_M_EXT);
> -            cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
> +            cells[cpu * 4 + 0] = cpu_to_be32(intc_phandles[cpu]);
>              cells[cpu * 4 + 1] = cpu_to_be32(IRQ_S_EXT);
>          }
> -        g_free(nodename);
>      }
>      nodename = g_strdup_printf("/soc/interrupt-controller@%lx",
>          (long)memmap[SIFIVE_U_DEV_PLIC].base);
> -- 
> 2.43.0
> 

