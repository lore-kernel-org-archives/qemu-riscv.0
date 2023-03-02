Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXXlZ-0004m3-F6
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 20:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXlV-0004lU-E3
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 20:29:49 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXlS-00054f-RA
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 20:29:48 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so1156713pja.5
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 17:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677720585;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=4NSj820n/OLL0cvzbAOh+WiZFVVe3LmL3YlRv5wYkZ4=;
 b=XX+3f9jfxv3O/Wy4FePqy+lHlAUE4f8Qkz7xUKFobWsJe1IlhEkvxshJg/EHJAh/Zy
 hUItocWjvlsP0cC1iuJYN54f7VL0KxrSXK4ycfP5l7QIHoaQNI+Znetoj6edCHZ8MZwL
 vIwVTkfzJ35i9ou9b5pKUZnT0XAGxJh8v9QpFM48XOEFNMnKrti/OOMeDxUjCJZNmkdy
 K/EUwmXzgUlQEVs5QljnJgcdxk3lP6sykf0rvIhlL6SnyHRjWdpBwwzxsp3WZcX4vI2a
 tXv7gKG0bL7yvcFOzWnnqYnMkyZdfBfNxbLntLT4Hx8b35vxIcmm+XGzYbdElnEsLjvG
 5LuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677720585;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4NSj820n/OLL0cvzbAOh+WiZFVVe3LmL3YlRv5wYkZ4=;
 b=iUxClFfwtzpa+4FuZCVUijKuMV/AkxAmhcs+slov7TecBAh5mdUGu9RQV5fYRMs8OW
 RHHWDZU1ED3B/y8Y1sfpLGUuB7CAoTFtSmbHakR8hyTgWNzPY4wXSlUrznDR2gZnP+fg
 t3s8HjxLsTbnDPk2VI/cNQTgNQAH9wmODQ1Suz6/xuYJfx9HsxU0p7lfQ60BiwW/MsjA
 B/qSyj4Dx1WIGi07q/YbKVSkSm5g9rNEY54iD/Pz9vItHUvYu99q9RcyjtJhcs3v1OOb
 d2DZP8hJRpP/jDIqYy6tN7VOn8veqAnYiCTRihSgSvArGNVcsOyMJBnKwl907ySR18VG
 rsZw==
X-Gm-Message-State: AO0yUKVZMCML2sCntvBunFARYtI8QksQEElNiYkaNUfG+FfyXoHiGAmF
 t02oLeyApO9h63/KnTH8FK2HIQ==
X-Google-Smtp-Source: AK7set+rkyCgms9l1ZzH2XogH7nANf/QwgNPjJIt0UWd4spQ30UNuV5ucfd0q/9nlXFPZHkRPbbvIg==
X-Received: by 2002:a17:903:2308:b0:19d:16ed:3e34 with SMTP id
 d8-20020a170903230800b0019d16ed3e34mr10651303plh.26.1677720584670; 
 Wed, 01 Mar 2023 17:29:44 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 b11-20020a1709027e0b00b0019a95764e68sm8940609plm.294.2023.03.01.17.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 17:29:44 -0800 (PST)
Date: Wed, 01 Mar 2023 17:29:44 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 17:28:55 PST (-0800)
Subject: Re: [PATCH v2 1/2] hw/riscv: Skip re-generating DT nodes for a given
 DTB
In-Reply-To: <20230228074522.1845007-1-bmeng@tinylab.org>
CC: qemu-devel@nongnu.org, dbarboza@ventanamicro.com,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bmeng@tinylab.org
Message-ID: <mhng-ec363adb-e2f4-4522-9956-b68b437bad49@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 02 Mar 2023 01:29:51 -0000

On Mon, 27 Feb 2023 23:45:21 PST (-0800), bmeng@tinylab.org wrote:
> Launch qemu-system-riscv64 with a given dtb for 'sifive_u' and 'virt'
> machines, QEMU complains:
>
>   qemu_fdt_add_subnode: Failed to create subnode /soc: FDT_ERR_EXISTS
>
> The whole DT generation logic should be skipped when a given DTB is
> present.
>
> Fixes: b1f19f238cae ("hw/riscv: write bootargs 'chosen' FDT after riscv_load_kernel()")
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>
> (no changes since v1)
>
>  hw/riscv/sifive_u.c | 1 +
>  hw/riscv/virt.c     | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ad3bb35b34..76db5ed3dd 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -118,6 +118,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>              error_report("load_device_tree() failed");
>              exit(1);
>          }
> +        return;
>      } else {
>          fdt = ms->fdt = create_device_tree(&fdt_size);
>          if (!fdt) {
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 86c4adc0c9..0c7b4a1e46 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1014,6 +1014,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
>              error_report("load_device_tree() failed");
>              exit(1);
>          }
> +        return;
>      } else {
>          ms->fdt = create_device_tree(&s->fdt_size);
>          if (!ms->fdt) {

Thanks, these two are queued up.

