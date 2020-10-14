Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSmpX-0000P1-3g
	for mharc-qemu-riscv@gnu.org; Wed, 14 Oct 2020 15:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kSmpV-0000Ne-98; Wed, 14 Oct 2020 15:52:57 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:37328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kSmpT-0005io-Lr; Wed, 14 Oct 2020 15:52:56 -0400
Received: by mail-il1-x143.google.com with SMTP id j13so789063ilc.4;
 Wed, 14 Oct 2020 12:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zkHkfuHZJnTiYMXWjW2JQkehntyeBbIil8/ZyhDIFCw=;
 b=fBIOkZgwcNrDiWXJi7FMZooyaazdw7xwNP63aaI/pw/XrkyCsMEmf+FGME0yr4gdfl
 IZEgXnH1iuhROkMI/0tLEwQ8MeJ29qjbUPFjHppzuqZY0ISeB/RC46jnFGS/N8L6E3h/
 XSvyYDy8qzm7IIHUAibti/qr+E/2SVIlOigK0eKXkh7XH0pUY8oXpquj728gYmaPXah8
 zDExdoCkE7lXmTh9WmXOLZ0z9jQAaZVWNnxU1jSJNw8NQjtWduMTEXEMmLq1IK36Ickg
 Le7Eg1Jywz0stmV+pK6b3Acc5IbJz5HtzMCr62d9xuwUNBJo5iQzFPixiCLgGXofM4IJ
 h5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zkHkfuHZJnTiYMXWjW2JQkehntyeBbIil8/ZyhDIFCw=;
 b=gd5QgXM1sXDv41NGPIl8NpnF/RE9AarK7tqPsbBEHs5J5yNTcyfw2cmXHT4RKX9UxO
 t6RMh8zGmC+jSGj+zBT8ARaRjZtUX0NbfvKyebiuuYVkGiC1iJI5beSsyds/DgBaD0TL
 EYcXBspAUDuVfJ+jqbapb+Bymra76XypVgGmUt2MXGLH3Br9+1am/Sp/FeTPBStLmjHO
 kwx+yl88yj0m4HGTLJfJNHPPk7512ID4TCEs7dd82onu5TWv4sGlcuGun/uq0belqTO6
 PeBzySBXsYzOkG6I8y51nhuZ8QskVItoXVkNM+p1Qa9J7cEiD5Yv6xT+CwzhhDdRcM58
 CeKA==
X-Gm-Message-State: AOAM532UzYUAerYXb3lenyiwjHG2F5lI5D+daCLyIWWIWOcPJMvmnXy2
 p8LLG6cq04VacbYUPCul6Z/sqxcPXF4vDgZ+LQ0=
X-Google-Smtp-Source: ABdhPJyQnKstD/gKJPc62MqJDQfbvhPBaabcwFHnMijW9dVAVGUct+MReGeRcdBmXrx5HkQ3gO9831MuG9VWiKNKcxY=
X-Received: by 2002:a05:6e02:1241:: with SMTP id
 j1mr666264ilq.267.1602705174239; 
 Wed, 14 Oct 2020 12:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201013172223.443645-1-georg.kotheimer@kernkonzept.com>
In-Reply-To: <20201013172223.443645-1-georg.kotheimer@kernkonzept.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 14 Oct 2020 12:41:15 -0700
Message-ID: <CAKmqyKMmVn6oDjcHVywToNe4mkRxUru2jH_pP43y4moJyXwxBQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix implementation of HLVX.WU instruction
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Wed, 14 Oct 2020 19:52:57 -0000

On Tue, Oct 13, 2020 at 10:23 AM Georg Kotheimer
<georg.kotheimer@kernkonzept.com> wrote:
>
> The HLVX.WU instruction is supposed to read a machine word,
> but prior to this change it read a byte instead.
>
> Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/op_helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 9b9ada45a9..3b7bd6ee88 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -334,12 +334,12 @@ target_ulong helper_hyp_x_load(CPURISCVState *env, target_ulong address,
>          riscv_cpu_set_two_stage_lookup(env, true);
>
>          switch (memop) {
> -        case MO_TEUL:
> -            pte = cpu_ldub_data_ra(env, address, GETPC());
> -            break;
>          case MO_TEUW:
>              pte = cpu_lduw_data_ra(env, address, GETPC());
>              break;
> +        case MO_TEUL:
> +            pte = cpu_ldl_data_ra(env, address, GETPC());
> +            break;
>          default:
>              g_assert_not_reached();
>          }
> --
> 2.25.1
>
>

