Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmlNP-0006jx-Fm
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kmlNK-0006h0-36; Tue, 08 Dec 2020 17:22:27 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:36915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kmlNG-0000pD-Sg; Tue, 08 Dec 2020 17:22:24 -0500
Received: by mail-il1-x141.google.com with SMTP id k8so16953614ilr.4;
 Tue, 08 Dec 2020 14:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sZi46PwDTCiNBxYN28eeYZtMufiT2lSdKRPtnPp2uBA=;
 b=NgF2ekg1k+9cO6s6Cj4qgZNZwesh5RVJ+yitVQ53jq9S4JnMEY1fAvKafFG6f2OP63
 zken1A5kvTmK+Ez35UygQMQPvHbemFUpT0ogHeO6SrlEx0oveiKGAuYzY5ief4uI0DYr
 l0b729ZZqdOLrpC5gNI8L9fNUIg2kRM64RAn5lVuoKy8b7qQk0bQZncY/OBhrgY+vugd
 GWW7TGAeH7rOxn7AnXSO+3pJhxvgGpdykrXBCI/+1xRQ1o5DF+2mlN8N30S1lPxedGJ9
 JG2Ct20Jr7ZdERUodYOTo8239xhBa1+Qpi7Xe9dngL2NSXPkZp45OdAj/cdyP6dnA3gO
 BBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sZi46PwDTCiNBxYN28eeYZtMufiT2lSdKRPtnPp2uBA=;
 b=DKPyxLsYDq6IPilSfe3+SrZvFqj4Hp+c1SIcp3tmkWjgoP6HIUMgt7fT0OcYQjB4iS
 Q0vYSMtB04dlhBZ5Ut0NmLvCDb7wJtnBjANY2tReOBJ8BqSlUatg7WieylcAJEMYvDki
 fOUQMBYxWXzTv5RkiIK2FY7Tab1sEGSSe8TPcYfbK3qLvW/mMvlV5cyhc0PA5KrXBQP/
 Z9hfDdzgaKshGTRVryeLAZ8TIxJIZ86CycieFnOdeQjyZdmVqHjyP/1Z2JvehRlzo5jq
 KGUEKolZezsJ2g1TgbKjduLwGJYpv21EO3+f+gEjiYKci+xst0aixlwurZ0ITFt4M5XO
 Q+hA==
X-Gm-Message-State: AOAM532rFRoLEKBIvMiY5/iUOrb5sY7rD7oM9z6U46wu1vGGv+UjnkD/
 TBYLZb0/Nix3+d0ZL2o4gPaUW5AepY8xt57fNxs=
X-Google-Smtp-Source: ABdhPJzhK+ClKrZDoSlIkxZpVfST+Oc77Aa3SIyIhTTwL7rDp0p10RRz2lBvAiWVB5rWGydt52vrwgvJbbDyIX/y0cA=
X-Received: by 2002:a92:490d:: with SMTP id w13mr12021ila.227.1607466141348;
 Tue, 08 Dec 2020 14:22:21 -0800 (PST)
MIME-Version: 1.0
References: <20201203124703.168-1-jiangyifei@huawei.com>
 <20201203124703.168-10-jiangyifei@huawei.com>
In-Reply-To: <20201203124703.168-10-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Dec 2020 14:21:55 -0800
Message-ID: <CAKmqyKMDWzBf29MgG7BsGTmweH7ZCRVqwCCqC620QoO776=cww@mail.gmail.com>
Subject: Re: [PATCH RFC v4 09/15] target/riscv: Add host cpu type
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Zhangxiaofeng (F)" <victor.zhangxiaofeng@huawei.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:Overall" <kvm@vger.kernel.org>, libvir-list@redhat.com, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, 
 yinyipeng <yinyipeng1@huawei.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 kvm-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 "dengkai (A)" <dengkai1@huawei.com>, "Wubin (H)" <wu.wubin@huawei.com>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
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
X-List-Received-Date: Tue, 08 Dec 2020 22:22:28 -0000

On Thu, Dec 3, 2020 at 4:55 AM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Currently, host cpu is inherited simply.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> ---
>  target/riscv/cpu.c | 6 ++++++
>  target/riscv/cpu.h | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index faee98a58c..439dc89ee7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -186,6 +186,10 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>
>  #endif
>
> +static void riscv_host_cpu_init(Object *obj)
> +{
> +}
> +
>  static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
>  {
>      ObjectClass *oc;
> @@ -641,10 +645,12 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rvxx_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rvxx_sifive_u_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
>  #elif defined(TARGET_RISCV64)
>      DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rvxx_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rvxx_sifive_u_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),

Shouldn't this only be included if KVM is configured? Also it should
be shared between RV32 and RV64.

Alistair

>  #endif
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ad1c90f798..4288898019 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -43,6 +43,7 @@
>  #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
>  #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
>  #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
> +#define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
>
>  #define RV32 ((target_ulong)1 << (TARGET_LONG_BITS - 2))
>  #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
> --
> 2.19.1
>
>

