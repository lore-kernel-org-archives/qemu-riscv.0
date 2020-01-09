Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipM0c-0002iq-84
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jan 2020 19:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56260)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ipM0Y-0002ga-7e
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 19:49:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ipM0W-00082F-5l
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 19:49:06 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41138)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ipM0V-00080C-VT
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 19:49:04 -0500
Received: by mail-pl1-x642.google.com with SMTP id bd4so1809311plb.8
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2020 16:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=H3zSPRBKP4ZzdR/6KbzozHd86904u26K/mFmLx9RqzI=;
 b=feh1JZ0rixUc1SjMjv50oJb+Uu0jBd1QfUGkdIbmUF5sZoItk0fH7Db7tog+l1OVyA
 O9NQCNB3K0pra7lD1nuchRau60eAPdIIErh1IksBuIYc8iCau2N4YV9zKFu7WISVT6yQ
 TslejvK561l3b7IBA6S2mxO8r5zvPGciY6HWySoKnBKNMhISoHLeoUNR9YZtTcyC7qYV
 af2TWoNv6xqbeZPY8tHdFQ8st2A7+q21hHZKH17TftXAaUgbdiwUQlb2Kyub0atwwukS
 wE3Dliy7tKS4c5OqmFn6aaibx7MInXh7JDJ6vcd3G5SC4l0mbxFH+NGJgyxyC8a/IowV
 rI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=H3zSPRBKP4ZzdR/6KbzozHd86904u26K/mFmLx9RqzI=;
 b=LX1SELs1+HkhitVbvK0dxMPl0cuVQMKEpnU4i6ld6EB6XffHyfW7Dv1YSY8kfw8e0U
 sb9EqWN2i8XFxP1o8Zuo0EW3hWp+t2yNgRSon5UKkrdncNB8H99Gu+7u72GMiIl13Mgj
 WMsEvAS5R8hOud4Z232/PXDMW4mA31mzLiNpGXzg6TLeSstNdZlTHk8xxK4YNWDc6bO3
 DDPiNqBAL6TG+IxPTF7aVJuMnbWjcx4wIv9sprp9zdclyXXJTZWy4awZdeSrQh1hwZho
 pBQGmnEP2W42UEJBAbGDP/zyGUbungV2HmUvoEvnx3ftN9xyjnaEB8CSQ6lqWuFu6CSU
 4Vzw==
X-Gm-Message-State: APjAAAUk5aIxdf950AfTn2SQf3KP0BRR2XBT4lZSxPFlFxz83VOwWaBv
 ysZW6NTUEjg1H15LOpGSA1aQVg==
X-Google-Smtp-Source: APXvYqxlNnHVU8Ubb9ccyNzIKNObfpQSyuIe2VJ4nm//zGUmzvwpz4fhSU0OO4ISvy8yuiRoUV5gow==
X-Received: by 2002:a17:90a:a88d:: with SMTP id
 h13mr1739046pjq.55.1578530942843; 
 Wed, 08 Jan 2020 16:49:02 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id z29sm5115273pge.21.2020.01.08.16.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 16:49:02 -0800 (PST)
Date: Wed, 08 Jan 2020 16:49:02 -0800 (PST)
X-Google-Original-Date: Wed, 08 Jan 2020 14:40:48 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1 26/36] target/riscv: Remove the hret instruction
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
In-Reply-To: <c83aac89b3f1825c4c3ae282495a28572031f7d5.1575914822.git.alistair.francis@wdc.com>
References: <c83aac89b3f1825c4c3ae282495a28572031f7d5.1575914822.git.alistair.francis@wdc.com><cover.1575914822.git.alistair.francis@wdc.com>
Message-ID: <mhng-5bd4e131-6645-4d27-8255-5837e004f8c2@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-List-Received-Date: Thu, 09 Jan 2020 00:49:08 -0000

On Mon, 09 Dec 2019 10:11:48 PST (-0800), Alistair Francis wrote:
> The hret instruction does not exist in the new spec versions, so remove
> it from QEMU.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/insn32.decode                     | 1 -
>  target/riscv/insn_trans/trans_privileged.inc.c | 5 -----
>  2 files changed, 6 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index cfd9ca6d2b..b883672e63 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -75,7 +75,6 @@ ecall       000000000000     00000 000 00000 1110011
>  ebreak      000000000001     00000 000 00000 1110011
>  uret        0000000    00010 00000 000 00000 1110011
>  sret        0001000    00010 00000 000 00000 1110011
> -hret        0010000    00010 00000 000 00000 1110011
>  mret        0011000    00010 00000 000 00000 1110011
>  wfi         0001000    00101 00000 000 00000 1110011
>  hfence_gvma 0110001    ..... ..... 000 00000 1110011 @hfence_gvma
> diff --git a/target/riscv/insn_trans/trans_privileged.inc.c b/target/riscv/insn_trans/trans_privileged.inc.c
> index b9b5a89b52..76c2fad71c 100644
> --- a/target/riscv/insn_trans/trans_privileged.inc.c
> +++ b/target/riscv/insn_trans/trans_privileged.inc.c
> @@ -58,11 +58,6 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
>  #endif
>  }
>
> -static bool trans_hret(DisasContext *ctx, arg_hret *a)
> -{
> -    return false;
> -}
> -
>  static bool trans_mret(DisasContext *ctx, arg_mret *a)
>  {
>  #ifndef CONFIG_USER_ONLY

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

