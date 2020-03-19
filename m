Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jEnAp-00008B-PK
	for mharc-qemu-riscv@gnu.org; Thu, 19 Mar 2020 00:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53594)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1jEnAl-00007k-Gg
 for qemu-riscv@nongnu.org; Thu, 19 Mar 2020 00:52:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1jEnAj-0003SV-Vr
 for qemu-riscv@nongnu.org; Thu, 19 Mar 2020 00:52:47 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36903)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1jEnAj-0003IM-Ef
 for qemu-riscv@nongnu.org; Thu, 19 Mar 2020 00:52:45 -0400
Received: by mail-pf1-x442.google.com with SMTP id 3so746570pff.4
 for <qemu-riscv@nongnu.org>; Wed, 18 Mar 2020 21:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ore1/QJ3+QFXuCPS5FSIlGtwUDNBh9zR2ouiJLI85iU=;
 b=aBUpXOD0CUH0ufEHl5Zj2Fn5BFIwhYh3ql1wLDbf0mo5eTmzl0ffi9hO57erDNjbVm
 FXveC+hqpm6+1GKPIRIZihOQ+zq8iDpl2y7nwDG8PweUTadccTNykgRhFTQ7NMzq8zi+
 w6nlHuPRKt5qbAsPdzjSWeM6CdbuHtRlB6LCRGXL8g86ElSDAes1O/y2S2/XxsT+tW1s
 lyiXviCQOv3lRrbrAsFgx8eRUrJYiYZ+8EHOuawFY++LOMp389XdOFyGnCOy0fpXDdqE
 +ybUYErjXF6kCrIBNeaZgl70Mj0i1qTrioCPnhS65UD3Vc00e0DKrbrq83D6oaZV5pZz
 BU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ore1/QJ3+QFXuCPS5FSIlGtwUDNBh9zR2ouiJLI85iU=;
 b=rzSoTO8uvyo2AF+5s6TuX0fRjVkyS7yl+3IJo+bcBbtsLwS5xRAJCe8D+cTWWfym4a
 VwthCENFD3w8+VBApt/zWuGw0IBlAnTBYuy+O9AQcjsaFtjO8ToHcy4fWTyS0wUXRM3f
 1IZKsbzVSTPC4nVbk8r5s77LU3Y8EChQmHQ0ExOIU5gyj8wMwecp45LtCCZjNmBrkdae
 dyOyJ/9BoZLKBvy4I3sCEVXtSx37aWtVLm1A3uCNNbtDBQC3CrSzv9aTTWtVZiSnf809
 5Plmhcx883+G5T4h607ZH4VwHQxlxCox+c/DjpeGK+E3TWPvbGdX6gdpFNCrcM5Xk55I
 tfJg==
X-Gm-Message-State: ANhLgQ3yg0K+6zdU56aU5V/zdUjZLj7kp7+c4hzUPf0/N8NVo0AyyImD
 oIo+15/b7v4Mm6xxBYvttWATJw==
X-Google-Smtp-Source: ADFU+vvw6GVf6HshBpOlFe068chBQpx2wKy+VD9gkJ8SLx0nt1/ato24DQ/wW46RusjNScAWPNvtqQ==
X-Received: by 2002:a63:48e:: with SMTP id 136mr1372326pge.169.1584593563769; 
 Wed, 18 Mar 2020 21:52:43 -0700 (PDT)
Received: from localhost (c-67-161-15-180.hsd1.ca.comcast.net. [67.161.15.180])
 by smtp.gmail.com with ESMTPSA id a19sm615566pfk.110.2020.03.18.21.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 21:52:43 -0700 (PDT)
Date: Wed, 18 Mar 2020 21:52:43 -0700 (PDT)
X-Google-Original-Date: Wed, 18 Mar 2020 21:52:28 PDT (-0700)
Subject: Re: [PATCH v1 1/1] target/riscv: Don't set write permissions on dirty
 PTEs
In-Reply-To: <c827880a47774cd3a6bcd59b79657f380da11d5d.1583284602.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-a099dca3-c871-45d3-85c4-58dc12f3dd1a@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Mar 2020 04:52:49 -0000

On Tue, 03 Mar 2020 17:16:59 PST (-0800), Alistair Francis wrote:
> The RISC-V spec specifies that when a write happens and the D bit is
> clear the implementation will set the bit in the PTE. It does not
> describe that the PTE being dirty means that we should provide write
> access. This patch removes the write access granted to pages when the
> dirty bit is set.
>
> Following the prot variable we can see that it affects all of these
> functions:
>  riscv_cpu_tlb_fill()
>    tlb_set_page()
>      tlb_set_page_with_attrs()
>        address_space_translate_for_iotlb()
>
> Looking at the cputlb code (tlb_set_page_with_attrs() and
> address_space_translate_for_iotlb()) it looks like the main affect of
> setting write permissions is that the page can be marked as TLB_NOTDIRTY.
>
> I don't see any other impacts (related to the dirty bit) for giving a
> page write permissions.
>
> Setting write permission on dirty PTEs results in userspace inside a
> Hypervisor guest (VU) becoming corrupted. This appears to be because it
> ends up with write permission in the second stage translation in cases
> where we aren't doing a store.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  target/riscv/cpu_helper.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 5ea5d133aa..cc9f20b471 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -572,10 +572,8 @@ restart:
>              if ((pte & PTE_X)) {
>                  *prot |= PAGE_EXEC;
>              }
> -            /* add write permission on stores or if the page is already dirty,
> -               so that we TLB miss on later writes to update the dirty bit */
> -            if ((pte & PTE_W) &&
> -                    (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
> +            /* add write permission on stores */
> +            if ((pte & PTE_W) && (access_type == MMU_DATA_STORE)) {
>                  *prot |= PAGE_WRITE;
>              }
>              return TRANSLATE_SUCCESS;

I remember having seen this patch before and having some objections, but I feel
like I mistakenly had this backwards before or something because it makes sense
now.

Thanks!

