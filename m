Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNjob-0005D9-Lz
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 19:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNjoa-0005Cx-Jg; Mon, 15 Aug 2022 19:48:12 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNjoZ-0006Qm-1c; Mon, 15 Aug 2022 19:48:12 -0400
Received: by mail-pg1-x535.google.com with SMTP id 12so7831855pga.1;
 Mon, 15 Aug 2022 16:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=47OFDDtteS0niVKTMTzCSGHpbnd4rcvMQMfO9K8kgAg=;
 b=SKaIyL1i3KAT0saBsJdnHrYvqwWaIkwrPYQz01ymw55PKGQPsGsiQAsnWBKTTJUVbS
 7Yv4ggDr4O6O3F26OEXlvk5RIRl/TcKaFuRpR7DyTgVfgYcGHD4fLbB7Q6OIzHyNiwsH
 VMSYDIbJ75pmelDSZg19TfXfrnxRZ7ly5B+UnwT94AIF90pgAwBp90SsOqmgOdOpus2G
 tcAFQeANyNlHpRehnoA2N+SRuLKhMk8g4Fpvq9i39+Z2pd2n+FC8+2HipYGsw7JT/1Eu
 uGDoe4Uz42wtlX5lBv8zMRuwixhk0XfiwChXHQRhNiexgkuAfCMkiYcWJQg5kBHwMguj
 Qrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=47OFDDtteS0niVKTMTzCSGHpbnd4rcvMQMfO9K8kgAg=;
 b=Cb1RuVOo9DFmKs8TmcTJAFHnZrHV6h+sMqkoi/pomL8FN2shbh5zuJ9gok6Y9QLQB/
 q/DPWgC4wgaRHScDEaimd6za0pyBKV/005GG7zCnre5SNwDWjoBeWUkFb/0A9+HSAXbQ
 0Y2crqtdDP3red+0VO3uwFulFT+6Q67KVZH6QFuSZlTsVUQZbQXzPXFddDt0bEk57CeB
 YHGVn2SVnnQw0BFnLffmvGP+AbtXuw848nvk/3gDQQJqhbkJtc+Y88c53m3hvPYfgTlM
 UXOLIx+P8AmpF6IpLENOBsiyKYy/v8Sn2OWfM+m5RWl5HeUx0zNySBB6CN9h+tQpwn9Y
 X7rA==
X-Gm-Message-State: ACgBeo02uEBVRCsH1q1LSIFOasN26HApHphvAUFKf8/wA4TwK8j58hzS
 +PbXhbRLbMcFF0Erl6ppSZNs4MVRUieguhYS6k1ffvih/8aveOKN
X-Google-Smtp-Source: AA6agR52QP3syNsTFMtmgbdgYoouiOU5RhJRU0ncw24tR3ew4IiWmw+KnCyDP5nEXmHEIUaTwAeQKDGSC/6+JhUrmVU=
X-Received: by 2002:a63:f14c:0:b0:41a:b83d:a636 with SMTP id
 o12-20020a63f14c000000b0041ab83da636mr15526488pgk.361.1660607288696; Mon, 15
 Aug 2022 16:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220815174138.19766-1-coder@frtk.ru>
In-Reply-To: <20220815174138.19766-1-coder@frtk.ru>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Aug 2022 09:47:42 +1000
Message-ID: <CAKmqyKN7XuiwjdXNAXz7JgQvBcA2MjV=FqczqtEqhN2xVF6VQA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Setting address of vector reset is improved
To: Maksim Perov <coder@frtk.ru>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x535.google.com
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
X-List-Received-Date: Mon, 15 Aug 2022 23:48:12 -0000

On Tue, Aug 16, 2022 at 6:15 AM Maksim Perov <coder@frtk.ru> wrote:
>
> Previously address is set by default value 0x1000 which is hardcoded in target/riscv/cpu_bits.h
> If add to new RISC-V Machine in which ROM area is not based on 0x1000 address than there is problem of running simulation
>
> Signed-off-by: Maksim Perov <coder@frtk.ru>
> ---
>  hw/riscv/boot.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 06b4fc5ac3..5e2438d39a 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -327,6 +327,10 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
>      riscv_rom_copy_firmware_info(machine, rom_base, rom_size, sizeof(reset_vec),
>                                   kernel_entry);
>
> +    /* change reset vector address */
> +    for (i = 0; i < harts->num_harts; i++) {
> +        harts->harts[i].env.resetvec = rom_base;
> +    }

Thanks for the patch!

We don't want to do this though. The reset vector is part of the
hardware design, we don't want to change the reset vector based on the
software that is loaded.

The reset vector is exposed as a property (resetvec) and can be
configured from a board. You could also configure it from the command
line if you wanted to (although it might be overridden, I haven't
checked).

Alistair

>      return;
>  }
>
> --
> 2.17.1
>
>

