Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llezp-0003Dx-Dp
	for mharc-qemu-riscv@gnu.org; Tue, 25 May 2021 17:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1llezn-0003CW-BT; Tue, 25 May 2021 17:53:51 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:42938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1llezl-0007Ge-NU; Tue, 25 May 2021 17:53:51 -0400
Received: by mail-io1-xd2f.google.com with SMTP id k22so8746491ioa.9;
 Tue, 25 May 2021 14:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oq3bYuIEb8HHq4uUjPz9CrgHORFAIsfvTxvFsKxgcBU=;
 b=cV0lOLIluchnYcF/kxP8oMLbYtssEN6ghmDppcti3P3d6CJffLcyKfZtDgzDa5EAZ+
 UKsH/M+0ox+V4IF4D3cKet0hN5rT3JRUUj7m3zeXcsEt057qid5HrbLsrdNt6QspfWqG
 3AsHQBcB1uqt5CCWD14nH/tNCHQt6eWuIe4SwSQLNxTMZtut0Q/HshK6tT0sO9fRFn2I
 qf/AkBJocYiGYQDZjX00K7ViZWrdYmpdLjco+BQCGljkseBoYN2GQp3hAMd/EpdKwvRf
 go7Y2cH2Gsuvd0i0agVIyWpjm3XE/62ztHpODVnQeUI4uizynzvgZ3lGF+RC5ydLAmVI
 485A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oq3bYuIEb8HHq4uUjPz9CrgHORFAIsfvTxvFsKxgcBU=;
 b=Ifr0jh2CIc09xwX8++kf4ePFcHGc1XtFPyH6FzdIMzfIEwoYwOTV//V27jv0KwheXG
 VYTtXPrtgn5U3EhMECV7+GB6TLyOvjU3y2ijgY3oMeIvx5kC9s+3mcFZ/HHHcZ7atcKm
 Ez/dXIaC2jJ8cVqfS6VFXE0K9iAYe5Epv7i61p63CW97e9PpLh7H/n7cy6jBIqXfxegA
 6OxDmS88Ans3k8tVPWETEmH23oHIixOqIfIxS9SWkTzyfCBm7Wb4k4wfcO/LLn4L75tz
 nV8Hp8q0qv4Qvr7/iWuDRKB1RbyAUvVooQXmylMrQp7H2v3kFv8LKYAQCz+ikz7UdAQV
 zYtQ==
X-Gm-Message-State: AOAM530O2jYBWmm9YCQm9VOJEpGyjKO3T8nSeIcK/Son8C6BpB+tLz/9
 xdri6i5cWGSQ2xA5HH2ZZMW7vBdc476CzLRfOw4=
X-Google-Smtp-Source: ABdhPJxDGFBS2TlWw3wLAnMBSMCgSwiR+zILen9S3dyzEvHyJ2xM+rGeOdiDASnIJ/bwfopEzrdwApwqlVB+IcziJt0=
X-Received: by 2002:a6b:c913:: with SMTP id z19mr23520289iof.42.1621979628356; 
 Tue, 25 May 2021 14:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <ec5f225928eec448278c82fcb1f6805ee61dde82.1621550996.git.alistair.francis@wdc.com>
In-Reply-To: <ec5f225928eec448278c82fcb1f6805ee61dde82.1621550996.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 May 2021 07:53:22 +1000
Message-ID: <CAKmqyKPes0r49Fm-fR8kbhB-PvDuC_skForij2i2E4_kK3ZBBA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] target/riscv/pmp: Add assert for ePMP operations
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Tue, 25 May 2021 21:53:51 -0000

On Fri, May 21, 2021 at 8:56 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Although we construct epmp_operation in such a way that it can only be
> between 0 and 15 Coverity complains that we don't handle the other
> possible cases. To fix Coverity and make it easier for humans to read
> add a default case to the switch statement that calls
> g_assert_not_reached().
>
> Fixes: CID 1453108
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/pmp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 78203291de..82ed020b10 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -402,6 +402,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                      case 15:
>                          *allowed_privs = PMP_READ;
>                          break;
> +                    default:
> +                        g_assert_not_reached();
>                      }
>                  } else {
>                      switch (epmp_operation) {
> @@ -433,6 +435,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                      case 7:
>                          *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
>                          break;
> +                    default:
> +                        g_assert_not_reached();
>                      }
>                  }
>              }
> --
> 2.31.1
>

