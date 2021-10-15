Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbFQI-0004PQ-Jx
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 01:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbFQG-0004Ob-8F; Fri, 15 Oct 2021 01:06:24 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:45771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbFQC-0000Nv-Fm; Fri, 15 Oct 2021 01:06:23 -0400
Received: by mail-io1-xd30.google.com with SMTP id 188so6367639iou.12;
 Thu, 14 Oct 2021 22:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XSMaZNQpGuvhnJ+sqHb/hUIBusX94lVf7FIMbm6WSCM=;
 b=R5Hd6sb17bP4C7K4l/iWClva2dlMVNWOC30yylRBveUb4JXAg3Yrhb/50WJTP//HXm
 1bdTwaWqvpTpZ1dv4/YTc0sfB7FG2OKCwBPJm4OFCyVmWrxUnmPNIsgM3CLr2nsxvILt
 UiYekInrH2BOX71YpPRFOK6bHLT4WuhambrXhwjn3SZo4TQ6ye9EDK50b+Ur1Gcnd9Op
 NUFW0HU11vkG2o0oSdi83DHM161Udr2ewEigNchdawNODp5t6aqXRaOGHzP9OPFm1Vto
 naUTtwRgfof7Z4G9RNmpjMIXiRZblhGrDYS4UOKGOtRIiEbsvX/CNpLj9WXH3y2S+Pdk
 gLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XSMaZNQpGuvhnJ+sqHb/hUIBusX94lVf7FIMbm6WSCM=;
 b=7uHzzZjW1mPtAf/O2MK1yHf4n0krFIyZbbaZ1OkpwJnZhIYEmzddguWLxIf6lQ3f+V
 2mgYOmbGq4abHNFCQ9ghn6EaQKcvZCDS52D+A/StglWVrIKjvzhPFZiaiqILW9UwFwVT
 4tZojx2ULJvDgb0YMgPOet9UJNW8nEwxkRI0hgKzWvwarGiTcl3igjV+X1iKujkPS9w7
 7ANA/gFGzsMAEZdiW09zMjgDeagm9wWCA5mXFdLwhB/mV+sudlSa6pDBhdjpbJZwJ3Vj
 oSctzZbO6wke4duEVFqld5e09MvDZ+/tqYpBwegs3InU6n20Hi1/Ai40qFyWiqXuZagY
 K7bg==
X-Gm-Message-State: AOAM5308rISsvLSyk7SjVI8N51CbBNzKpQlvwgvMggN5/FbZLhGMeK1p
 nOVMuQgX6PTDUJuR5FGWzxQnKnJhh/by5O+iF68=
X-Google-Smtp-Source: ABdhPJxVywlpBjaNqkWItfgwy1GJ5DlvbcPtc2dkHn303g16tleWCI24CGQ8fqEkUEVjggMaO5939F8Q9iECt4PnQtE=
X-Received: by 2002:a5e:9612:: with SMTP id a18mr2270887ioq.57.1634274378460; 
 Thu, 14 Oct 2021 22:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-5-richard.henderson@linaro.org>
In-Reply-To: <20211013205104.1031679-5-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Oct 2021 15:05:52 +1000
Message-ID: <CAKmqyKN_7xOOJvFdvGwfDTcpkKSOTbCTNbkmmV4=4f+1bm0nJQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] target/riscv: Replace riscv_cpu_is_32bit with
 riscv_cpu_mxl
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, liuzhiwei <zhiwei_liu@c-sky.com>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 15 Oct 2021 05:06:24 -0000

On Thu, Oct 14, 2021 at 6:54 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Shortly, the set of supported XL will not be just 32 and 64,
> and representing that properly using the enumeration will be
> imperative.
>
> Two places, booting and gdb, intentionally use misa_mxl_max
> to emphasize the use of the reset value of misa.mxl, and not
> the current cpu state.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/cpu.h            |  9 ++++++++-
>  hw/riscv/boot.c               |  2 +-
>  semihosting/arm-compat-semi.c |  2 +-
>  target/riscv/cpu.c            | 24 ++++++++++++++----------
>  target/riscv/cpu_helper.c     | 12 ++++++------
>  target/riscv/csr.c            | 24 ++++++++++++------------
>  target/riscv/gdbstub.c        |  2 +-
>  target/riscv/monitor.c        |  4 ++--
>  8 files changed, 45 insertions(+), 34 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e708fcc168..87248b562a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -396,7 +396,14 @@ FIELD(TB_FLAGS, VILL, 8, 1)
>  FIELD(TB_FLAGS, HLSX, 9, 1)
>  FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
>
> -bool riscv_cpu_is_32bit(CPURISCVState *env);
> +#ifdef CONFIG_RISCV32

Besides the typo:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

