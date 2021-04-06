Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lThAk-0007D2-JA
	for mharc-qemu-riscv@gnu.org; Tue, 06 Apr 2021 04:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lThAg-0007Ab-5c; Tue, 06 Apr 2021 04:34:50 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:34579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lThAc-0007Ij-TU; Tue, 06 Apr 2021 04:34:49 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id i144so15336794ybg.1;
 Tue, 06 Apr 2021 01:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rQ/uB+s94WRIijxf+2GVfA0+Zw4N3fOgZAlfGP3RR9U=;
 b=KKmZPCqt27uVufOKb5BlTGQ5PCXDsA8Gknz1Lz/oVTpgLVw2vSZlKPzBGavWB447gc
 rVkx4HWm7zLDWahMqGsEqMYifoq/qeideCAPcSx1aEreMJMftURWlljFtdDS7ofLWHlE
 SwkThxJz5wVKAj5we9uZa6Wqqgj5ToA/SsjxpmlQpseKzRhLBTqhIhNiZ7C2934igZmC
 Fyf5LWeuXEa67FE8iHpJtPEjoUV5itMuaSC6hXy676Sj8uweS7m3MlIWJ5aCN67Qrh4N
 pZLlxUv9VOFebUtDz7D1hFhlpvAQuTZd3PqClrIlg/0p+JjufcU0YqfHrV+rERCYCUAS
 a5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rQ/uB+s94WRIijxf+2GVfA0+Zw4N3fOgZAlfGP3RR9U=;
 b=ehe0WkuxPSNuFTRUuhoh9uBfVvxy5PF3uTsDVCHE+vSRjSmf3s36WacwpxMAPmfytO
 XzRYIfoTtXbHmn79cMJ3YLS+aw616kz/OM5Euw37BRK1RkKEssHyX85u01+ZmnQH5Xls
 UhXX9tthaRhj6hVXQqZ21fo/a9ILOwfndpGnIrbpwMOa+NXgQB0prFOGGn2nQcdyeYmo
 pA9GsC5cIzanshlwIikJRkwogE4Co8c1zZ6bmAi/M6O4H9NPv9pHZovGy+RtCM4RqO4Q
 CVvOe63thdaLHkqP5t8mklpZgb7tjwvrtjb/CxEzXl4iWLdsjpFQJK7NOiE/oJsdr0lj
 pm7g==
X-Gm-Message-State: AOAM533BRjFVZImbFvpqYL26gUd8IJs0ZF2QMFJ4gP9bahmi9NMJFSAs
 ohY7aHQ+9P1+S3TDawURqAYGOWSO18H6vdWMDVS57aLg
X-Google-Smtp-Source: ABdhPJyIvaoLOIFC5fyacK9HVBP4wMjj4FgmdyAVriTpbQvkNGIy2tnqLxWO8QJCwK0jtFzVatNk+B0uacTmWR6GlWA=
X-Received: by 2002:a25:4154:: with SMTP id o81mr25792817yba.239.1617698085649; 
 Tue, 06 Apr 2021 01:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617290165.git.alistair.francis@wdc.com>
 <187261fa671c3a77cf5aa482adb2a558c02a7cad.1617290165.git.alistair.francis@wdc.com>
In-Reply-To: <187261fa671c3a77cf5aa482adb2a558c02a7cad.1617290165.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 6 Apr 2021 16:34:34 +0800
Message-ID: <CAEUhbmV6EAeK5L8TgidV-oRCRZDRd+hKa+ak6C8M=cscsx2NWw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] target/riscv: Use the RISCVException enum for CSR
 predicates
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
X-List-Received-Date: Tue, 06 Apr 2021 08:34:52 -0000

On Thu, Apr 1, 2021 at 11:19 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h |  3 +-
>  target/riscv/csr.c | 80 +++++++++++++++++++++++++---------------------
>  2 files changed, 46 insertions(+), 37 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

