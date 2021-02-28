Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lGFIU-0007Lx-8Z
	for mharc-qemu-riscv@gnu.org; Sun, 28 Feb 2021 01:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGFIS-0007L1-JW; Sun, 28 Feb 2021 01:11:16 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:41092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGFIR-00027g-5J; Sun, 28 Feb 2021 01:11:16 -0500
Received: by mail-yb1-xb29.google.com with SMTP id m9so13495078ybk.8;
 Sat, 27 Feb 2021 22:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oxlE7ibRelWuNP6WnQOBUFOBkmNL+n7RTdVDTiUCqMM=;
 b=g6R5bHTgZzQl9+p62Vz9qGs/DcGosFeS1Fnchw2zwA3Z6r+HLJtzotgta03hg0eNt8
 ugsobCIuzEgSFo4q5zKOj80uVOyWnD6cbLejmz9AxLDA0uPcfo/AhrvpvqQKdY0W5z9j
 tFZK5p3S1RUH+4b2A8IqTUMk0uzpmk4EGaZLu91JGrsR99Nv7xcoO7000K1wvgr3lgz6
 IdYVaLwWqxmlA1foWcKeZVrfBXFt4VQQRfDLW4Cr4b/uR6qe8vNHcDcqKuDQlx9IEG9i
 P+ge19EeX1qzZFGEJUE5Xdfuuhm9Q70aZCQw9eiTQe3/YqtKs+NxdMMsoYR/JAiJAdvd
 uzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oxlE7ibRelWuNP6WnQOBUFOBkmNL+n7RTdVDTiUCqMM=;
 b=fwapHap7+/9q1kSTa0PQkcVSafr57vwTwlasKJpmHVDkj56JmU/1moJJd676jgsBBh
 TnVOzUVv7toDc3Je8rWclACaobpnLouTPpCagrWJxrK7r3SEsT6LeLvV02BOY/AgCom+
 mCQTd3AP4dwlpV8ym8Vg4MlguYgZstwWdRRry/GP1ZWAK+/Mf6VIZEc1irkT/8S3eCkN
 aJp3sW0rlZQUIxE5Q74i5pXIt6eJWdC6mGf0k7U5Wl7Z/QGECrHf7EuOt6Vfad3XvJYI
 ZMpvjdnEl52i2Egxe5KIkSXxyzY+RH+J/+dEdUiHZX6fJJPPunuuIG+2flhOW/YN9pZe
 0rrQ==
X-Gm-Message-State: AOAM531VfvLnax349KVh0jb3Tk5jg3hV7pscRm16jElVr4H4dKKk3iMX
 gFVXdIf4cZdBL4GNRtbGLNHaKFA4A1YlPxl+1ZA=
X-Google-Smtp-Source: ABdhPJzmTI7vNK7ZRzTYX7waKxH6EAb+yhpTBCnVjyTUfcaNEBzKkFNCNyE0/pehTA7inLJTe4k6izfZJxKAQL4iJCA=
X-Received: by 2002:a25:d08d:: with SMTP id
 h135mr15213977ybg.122.1614492673803; 
 Sat, 27 Feb 2021 22:11:13 -0800 (PST)
MIME-Version: 1.0
References: <20210226035447.1252-1-ashe@kivikakk.ee>
 <20210226035447.1252-3-ashe@kivikakk.ee>
In-Reply-To: <20210226035447.1252-3-ashe@kivikakk.ee>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 28 Feb 2021 14:11:02 +0800
Message-ID: <CAEUhbmV=vyXSXDg6xPUSHpSX7Lg8Z6tHz2MWuLHGtTHK9LMSMg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/riscv: allow ramfb on virt
To: Asherah Connor <ashe@kivikakk.ee>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sun, 28 Feb 2021 06:11:16 -0000

On Fri, Feb 26, 2021 at 12:34 PM Asherah Connor <ashe@kivikakk.ee> wrote:
>
> Allow ramfb on virt.  This lets `-device ramfb' work.
>
> Signed-off-by: Asherah Connor <ashe@kivikakk.ee>
> ---
>
> Changes in v2:
> * Add DMA interface support.
> * Add ramfb as allowed on riscv virt machine class.
>
>  hw/riscv/virt.c | 3 +++
>  1 file changed, 3 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

