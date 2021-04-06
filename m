Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lThAs-0007GI-Sv
	for mharc-qemu-riscv@gnu.org; Tue, 06 Apr 2021 04:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lThAi-0007B3-Ol; Tue, 06 Apr 2021 04:34:52 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:46775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lThAf-0007K0-Gr; Tue, 06 Apr 2021 04:34:52 -0400
Received: by mail-yb1-xb35.google.com with SMTP id e188so4297997ybb.13;
 Tue, 06 Apr 2021 01:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OlyjwHKRNMDKF4168ciH3tJQxNybjZ+zyXKXQiTIjEo=;
 b=JMPQZSGJ2obuT66cPC0eDyF/RmJSixrDRNljqrQbowWbWBkrriEDnXGWIr2Jx/pCIH
 sNeRH4t7PJsTqn67/YSJ4YyrF9bVu3voeNcpwLnIzd7qnzSwIxAcLpnD61TrQHjO562h
 gcgycaGNXDJwEL4YGMIjjpJzoS9l842ZQJQCI0SZQvNwGoaWtjqB60pCeC/mod0Nzekp
 60uf/zwNkiTQNf/BBy2d0xeZ1TmbmPjiHGVQ/KI1VScuLLYA7tSXyTipcdPMtR+EABwk
 IlWomASSNtV8QW1znJufE88Z39Z+SbQCSrScWKo7v81Wd7NXvCK5wsYdtZyGScUdWbGz
 eCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OlyjwHKRNMDKF4168ciH3tJQxNybjZ+zyXKXQiTIjEo=;
 b=pjNlk5YjmBQaTQYYsgMrHaPE0cLVJiEGK0TTqG6B4GpR7qaSzxVHNVuI34udn6LdI5
 s5Wlrxsjy8hp9TY06tUsKrPuyMdxf6VKX+7I9mrmaMDwBWecE2Z6xmJXZ8w/sXHPJLN1
 2PIbytRKxLYg5Fq6ODdQJcnRfNaO6NjxrRHXf9CeBtuJTv9tSn983Z03iilLlOFPucD0
 zK8oRBlw4VoGVJXIFWxvlpPafz446neuJoPsX+8YZWI9CWd/Tif4J+LyOeEe91KgHQvf
 w254YEqJ7vwYK5p7CjXDTLE+F3LGZlGZ1Py/ndx9eRy3QHY+DthVwsBU0adTDBUhsHzd
 rF5A==
X-Gm-Message-State: AOAM530mZ5ZzoIr1Yjwk4XKpewCpW/W7YpD7moKJPvl40so6XRjwS3yT
 41MJ1zT6js6M2+JIXkLaX8bFCRTmWaLrX6rERgq0U6mX
X-Google-Smtp-Source: ABdhPJzUfXo1DU+zDrdcg/y29U+C0gXdiYjIH8yKPe+MCHymsV681L17liKpNFzwHmW/ENRWfpj2XdNGBmNaVWFi6bU=
X-Received: by 2002:a25:e04c:: with SMTP id x73mr36128926ybg.387.1617698088264; 
 Tue, 06 Apr 2021 01:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617290165.git.alistair.francis@wdc.com>
 <cb1ef2061547dc9028ce3cf4f6622588f9c09149.1617290165.git.alistair.francis@wdc.com>
In-Reply-To: <cb1ef2061547dc9028ce3cf4f6622588f9c09149.1617290165.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 6 Apr 2021 16:34:37 +0800
Message-ID: <CAEUhbmW__1NR10=BFEc31TTBYVLhHpm0j-5okw_LsVqb9-B-Qw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] target/riscv: Fix 32-bit HS mode access permissions
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
X-List-Received-Date: Tue, 06 Apr 2021 08:34:54 -0000

On Thu, Apr 1, 2021 at 11:19 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/csr.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

