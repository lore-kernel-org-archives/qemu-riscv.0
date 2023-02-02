Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNNgd-0002rd-RY
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 19:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pNNgd-0002rR-0L; Wed, 01 Feb 2023 19:42:47 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pNNgb-0004is-Ee; Wed, 01 Feb 2023 19:42:46 -0500
Received: by mail-vs1-xe36.google.com with SMTP id a24so214149vsl.2;
 Wed, 01 Feb 2023 16:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VusAgGMQT9zcinR+eloFSeGZ13lX26cIHREOwtXXVa8=;
 b=NlsKslbBH11V8Zv4KthCyGtmzJb8++2+sWpSbrn18CstqylJ09U7Vl+agOS+WmRZQW
 Rh4sNpJgqKzPnlZAYqo0QfOj3ztb0xXwamAq8ZnzN3bQ0hCT80O6tFMGGc8pXnFMzC4n
 2LHPiY+jTd9JTsdsxsbyykxHhktSkViDJmBNwimqYrw9z/XDSNhBr5tKcfXd52pFPJgu
 QRMfiPbofvv1elJFElLt5HuVkK90eMm60bdNfid9+ysOec7ikelf9G626ba2SdynX4nJ
 EBzaoIOMOaL/hjSY+HLDbmhVtJo68+zbQzUa9hEpeuJRXNCfFJS8pJ7zqteUlzM8zyUx
 NjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VusAgGMQT9zcinR+eloFSeGZ13lX26cIHREOwtXXVa8=;
 b=Ih7ERoY9cSsz7+FDE8GuMJQki+g7GzI4BEfpMRZele+WZBc2s8ylz1ba2iJ0F1w4q4
 8/YUpdgCJzfIMiZ2rW37DRyeryt6+q2vLcGkmnJKedVZNDiMnNM2dVJExsZRCAQaOOT2
 lL8Rx4Qus4SE/JQm3IQ1jYCaz6xog6vaWs+0fVcju4L6SMhsdHfaZEi63IJ7OsIgkWQm
 AoRUHP5dKr9OH9jRbxJRba7xzD7YfkevMqRR+cvHoeVoYKSB0QVKGQRWjjUrRWEuIFfX
 3ZIGmncFbunnmVu0B1xNTNWZcf1Iip0fLVL2rpQhlQ+Z+4HvkcMt73DmPg+VEXuAaKdQ
 XA8A==
X-Gm-Message-State: AO0yUKUGi9SZwsJIXcrrvijylnzsRR6d/JTGWM6qXKGZQZf5AfzssJQ4
 WSzO3FGbOoQKrx1xRqMGaR4gvs/2d/bwbAPC/l8=
X-Google-Smtp-Source: AK7set9P7QIU6UFVFMwKTKhdg9gqEZ/h/i50Lmoep64X0RFf9VB4Imh78p2RjdZyIqR/3hjZQKAj4s6JexLinL3LYFg=
X-Received: by 2002:a05:6102:52e:b0:3fe:5a64:f8ea with SMTP id
 m14-20020a056102052e00b003fe5a64f8eamr752392vsa.54.1675298563758; Wed, 01 Feb
 2023 16:42:43 -0800 (PST)
MIME-Version: 1.0
References: <20230131170955.752743-1-geomatsi@gmail.com>
In-Reply-To: <20230131170955.752743-1-geomatsi@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Feb 2023 10:42:17 +1000
Message-ID: <CAKmqyKMtFzDTpTy=pdOdegO9Ow=e6TMKtksKSYAb8xi5C6KHTQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: set tval for triggered watchpoints
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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
X-List-Received-Date: Thu, 02 Feb 2023 00:42:47 -0000

On Wed, Feb 1, 2023 at 3:35 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>
> According to priviledged spec, if [sm]tval is written with a nonzero
> value when a breakpoint exception occurs, then [sm]tval will contain
> the faulting virtual address. Set tval to hit address when breakpoint
> exception is triggered by hardware watchpoint.
>
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Thanks!

Applied to riscv-to-apply.next with the typo fixed

Alistair

>
> ---
>
> v1 -> v2
> - do not set tval blindly for every breakpoint exception,
>   handle current specific case under consideration
>
>  target/riscv/cpu_helper.c | 6 ++++++
>  target/riscv/debug.c      | 1 -
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9a28816521..f1a0c65ad3 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1641,6 +1641,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
>              tval = env->bins;
>              break;
> +        case RISCV_EXCP_BREAKPOINT:
> +            if (cs->watchpoint_hit) {
> +                tval = cs->watchpoint_hit->hitaddr;
> +                cs->watchpoint_hit = NULL;
> +            }
> +            break;
>          default:
>              break;
>          }
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index bf4840a6a3..b091293069 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -761,7 +761,6 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
>
>      if (cs->watchpoint_hit) {
>          if (cs->watchpoint_hit->flags & BP_CPU) {
> -            cs->watchpoint_hit = NULL;
>              do_trigger_action(env, DBG_ACTION_BP);
>          }
>      } else {
> --
> 2.39.0
>
>

