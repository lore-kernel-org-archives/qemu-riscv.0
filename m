Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o0Y2j-0006Sw-MI
	for mharc-qemu-riscv@gnu.org; Sun, 12 Jun 2022 20:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0Y2h-0006P1-Jc; Sun, 12 Jun 2022 20:34:55 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0Y2f-0004BN-W5; Sun, 12 Jun 2022 20:34:55 -0400
Received: by mail-pl1-x62d.google.com with SMTP id f8so3779877plo.9;
 Sun, 12 Jun 2022 17:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tBpVS5xujZA9UDRMteWS0SZLjQ3jurfSdzxkTy7Y5m4=;
 b=J8b+Nj+Ht9ksykSSE4ojsMcSOjl2aUWTTrfl4HA+Xz/HSmDJdwqBWbPtua/MPNoObZ
 WMIWGBCyg0EvS4b+ECI28r+z4KFPitf7KAhtwLTFzfac3pFbQ20CgGmJQDzZ6bIWj7dp
 qXZZL0vBVYYDwZhPRORVufh6I6g7hJ+wf+ae9J8PTgTrqNmdpzRGfpjiQPvvxXQU0pWj
 1prYEu1nIEVdXPVz/LGFZzngy45WiK3iBcUNrh+99tkwHwoF73YzZEVEphN7eVV2vRpk
 VWCIMsbPgapGGUkvrVSj7FAM1QRvD97HXO+Nfb8hyT8DjVVbxNPEfyi1VJmykymkMt1Q
 m3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tBpVS5xujZA9UDRMteWS0SZLjQ3jurfSdzxkTy7Y5m4=;
 b=POGldam0jZcvuWgCZ9FnYFK9a5jLAqAwOTtN29uHShd/oBaIvhTe/nj/Q8ErWeq1jK
 cye0/uWyyp3WdroaPZkPmyEFyPqDu5aXnR1jmR7s2b83la2Uz+0rnlOb6y+pGOoCS8X1
 pTq7E+oTiRLa/TIFcSiMlgqiDTl0FlLwCoBZSJFdfU6ZzlUxcQhQVxf1MwBdQRHE+B0V
 zoJp1RbcDfvBP8wCFlIlQYWtYamMdXy9Kv4TGAmUwkAklbs8Yoyy4F+RRxNlx3U1eZmb
 g3ZCwbVYFCnUNOIwngW5I98scBe6mH0TsfNvqlfgUo59I9jcXK3xPf3FCPeNQuTl3lyF
 0GWQ==
X-Gm-Message-State: AOAM532aP3BRiVUhneC5t66W/0GP+4W8Uh5qRHYc+OWEF6nBSezNQysf
 hYfJwVsrUiUcHtWytbCLlO/xU4Ei90KiBxNp9e0=
X-Google-Smtp-Source: ABdhPJzIw7fA3UKR7WnrN+QyhLeeseQC/Fz4hcHUpT6WPX3VHML8yJkKSjZQ7azV07ycGubQ7aqMKPOiZPRWObMzbZU=
X-Received: by 2002:a17:903:216:b0:167:921c:6590 with SMTP id
 r22-20020a170903021600b00167921c6590mr30812997plh.83.1655080492258; Sun, 12
 Jun 2022 17:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220609010724.104033-1-bmeng.cn@gmail.com>
 <20220609010724.104033-2-bmeng.cn@gmail.com>
In-Reply-To: <20220609010724.104033-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Jun 2022 10:34:25 +1000
Message-ID: <CAKmqyKMzVLWQFw+fChSzwX2SC8Y==GjCp6fa-kPGNbWRV+2F2w@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/riscv: kvm: Set env->misa_ext_mask to the
 supported value
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 13 Jun 2022 00:34:57 -0000

On Thu, Jun 9, 2022 at 11:09 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> env->misa_ext_mask might be set to the same value of env->misa_ext
> in riscv_cpu_realize() based on given properties, but it may differ
> from what KVM tells us.
>
> Let's set the correct env->misa_ext_mask in kvm_arch_init_vcpu().
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  target/riscv/kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 70b4cff06f..c592980299 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -410,7 +410,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      if (ret) {
>          return ret;
>      }
> -    env->misa_ext = isa;
> +    env->misa_ext_mask = env->misa_ext = isa;
>
>      return ret;
>  }
> --
> 2.34.1
>
>

