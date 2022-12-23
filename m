Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8faD-0007XV-QF
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 05:47:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8faB-0007XD-Sq; Fri, 23 Dec 2022 05:47:20 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8faA-0001cP-Bi; Fri, 23 Dec 2022 05:47:19 -0500
Received: by mail-ed1-x52b.google.com with SMTP id q15so4980545edb.1;
 Fri, 23 Dec 2022 02:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n7Wiiu8tlapJK55u1aQvntG6l5kgQbESy2X//o4GqOI=;
 b=O8WnFD98We4S6+q5FwtfJ2nUyOA2MGRUPJzJHxTMJtZR2TWkami79FaawCJ/luiZLx
 AOM13xikVEralLEBiiHjqlUXw4kOHs01QAZLPDaCJMbQr+TYzDlGonDqycTHMgLCWIUx
 /tN3CJ0tXAkkzuvnU+VwZYOHXlY+OR3s+L5lLuRPowGBuC05/G4g8zueQbd/4QvFfezP
 wwMnrXmG1fqK5FJDcAahnm+mjpUtKcx9ogMwjjHLI+K2Hrr+AHOva0OPWfYbQxikHHwK
 yBWBeFTnkj5TErtydt0pAN7ekE9YnHefCelmVOhcDWXEOFERzl5OQJ/REg9jJv5VuHPm
 txEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n7Wiiu8tlapJK55u1aQvntG6l5kgQbESy2X//o4GqOI=;
 b=OEp0gti7j5cGwnhLSUGMHxqgCZsbS3G2rnePnMGbtrNgQZ+c9ByNYtQgmNskGteNCf
 IMNOjSpvHhlRarkcxNzscQgM0w/x9DvLvs7+IIBkMqeX8p5XdDSssQwyolGs12eUmzXv
 sLiTybML3IJGCcoTumROEGpnGg3R+iZUR2m/3mVdWU6ixuw9rdRAqFi5Sfs8hbKBKmyo
 NAWcyp+EdM0ggdDK7QyJ86RTnma4KGW9FWZdM0oEY7iyXzh2X9KZfARkwonbdrtEIS8A
 U6evr2hLoMmNHSMElaNw1ifF0EbISst9e1wdlrlg3w2MeuaFXkLxpaBuykxkHdSF+JWA
 w+yA==
X-Gm-Message-State: AFqh2kqFyvp6DIftbq+0p+uhsI7SPckp1FH3SsmwKmKhR7CwSdTPvs7Q
 H/bccZwjiu/ls2VIZNxl1PRsfgqQBtf5kIO9lHg=
X-Google-Smtp-Source: AMrXdXtTMbdxvVDiuyOtqxf/Ws3EOMnWWLKAeGac+/V8q/MyiksKQJF2u8orIJ7i7tfutnHKWFGc2AdCJhS4iLO3k8g=
X-Received: by 2002:a05:6402:6c1:b0:46d:94b0:e6e5 with SMTP id
 n1-20020a05640206c100b0046d94b0e6e5mr1057299edy.380.1671792434979; Fri, 23
 Dec 2022 02:47:14 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-10-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-10-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Dec 2022 18:47:03 +0800
Message-ID: <CAEUhbmX9LEOPcmmfAe+t6kL5xEyPqhQaisWJp0CewhFr8R6ECg@mail.gmail.com>
Subject: Re: [PATCH 09/15] hw/riscv/boot.c: use MachineState in
 riscv_load_initrd()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52b.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 10:47:20 -0000

On Thu, Dec 22, 2022 at 2:24 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> 'filename', 'mem_size' and 'fdt' from riscv_load_initrd() can all be
> retrieved by the MachineState object for all callers.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c            | 6 ++++--
>  hw/riscv/microchip_pfsoc.c | 3 +--
>  hw/riscv/sifive_u.c        | 3 +--
>  hw/riscv/spike.c           | 3 +--
>  hw/riscv/virt.c            | 3 +--
>  include/hw/riscv/boot.h    | 3 +--
>  6 files changed, 9 insertions(+), 12 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

