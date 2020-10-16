Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTW6I-0002f1-5D
	for mharc-qemu-riscv@gnu.org; Fri, 16 Oct 2020 16:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kTW6D-0002dB-TO; Fri, 16 Oct 2020 16:13:14 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:44691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kTW6B-00061G-JF; Fri, 16 Oct 2020 16:13:13 -0400
Received: by mail-il1-x142.google.com with SMTP id z2so3995884ilh.11;
 Fri, 16 Oct 2020 13:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v4qxiVPIRF1H7xS8eC0WSYVLrVWqHmrpyrYaqNGeG68=;
 b=koyaSkX5r3YZRSgpNn3BYwFDsUqJy3sdzzKV4PlKbpxbtCaIF9G/gPzMXZWFheeggn
 fKHg2xstOKdN/gF4VAplPbx0+vNxQ+K3A7kEnV1Wky5dyrg3i7Q+M4OCisf9ir2mAeFq
 lECQaKdGCqhz45ZDB2hEekubbTiJOp7d0HDJCeUvMLBZMM/pjxEbfBMcg/MBc3aad1/W
 tr6fzI9HsZMzfl+4x0Zy5pKb1mXY/lpwwvD3mX0/mipNh+6NSHmHyK4ggANcOQlTY1bj
 ibjCo8aj7VQfqP8bbhQ7/3PnMCsrneJ0VgoB/rx/VuN4w3PjRGZlcwTk2hLMIMD999Mh
 lJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v4qxiVPIRF1H7xS8eC0WSYVLrVWqHmrpyrYaqNGeG68=;
 b=NvB6YOi5tEqq/hpzy/8agDEJlpFHq+Tewy68/cxIRd0rA/+9rXzkJyGZ8myvghpXLi
 7RPlYMfCpBmn8bM1ki1xOINwZd34kMJJ691EqVxGUgR+zaWb+gTFDoWVDMQ/M9m0uzql
 tPu8b5hauz5aOOowOIJHbicpRK8ogQjMwC73JYrLHAOl5KmzvjHN75HGEBw619Sx1rD0
 2/SdrlZoEbmQuH9YrY2nUde76F4z5tR4XzXlalmM3wsdIROcYBJjN20xnlxArpRUfHwk
 3SAsqB/sPJlP+1aTpvoxAX+//VFyOxCeZyGtzelbOCYRXsdpua0Sc+n4TCseuz0KNynS
 mauw==
X-Gm-Message-State: AOAM531O+5mD6OU5MQumkTMben8s+WL2hV7nf27QQbdB3HVZbdc0608V
 ruoHxLKn7lVcdj11cK1FIumU5VB6P+O14lyHG4g=
X-Google-Smtp-Source: ABdhPJxacrUH2y6MrA2LwJmn26Gjh4bwtLLe4YAY89FPCRT253V5UEY2rBlsExMWv1LeMdXUr3gEQgMXnpptit7vCjg=
X-Received: by 2002:a05:6e02:1241:: with SMTP id
 j1mr4286658ilq.267.1602879189785; 
 Fri, 16 Oct 2020 13:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201016181548.1096112-1-laurent@vivier.eu>
In-Reply-To: <20201016181548.1096112-1-laurent@vivier.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 16 Oct 2020 13:01:30 -0700
Message-ID: <CAKmqyKMPDJj=_=_Vw_gjbut+8eKUAojmHigWmgx2WWVTm04Y0A@mail.gmail.com>
Subject: Re: [PATCH] goldfish_rtc: re-arm the alarm after migration
To: Laurent Vivier <laurent@vivier.eu>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
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
X-List-Received-Date: Fri, 16 Oct 2020 20:13:16 -0000

On Fri, Oct 16, 2020 at 11:16 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> After a migration the clock offset is updated, but we also
> need to re-arm the alarm if needed.
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/rtc/goldfish_rtc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
> index 0f4e8185a796..e07ff0164e0c 100644
> --- a/hw/rtc/goldfish_rtc.c
> +++ b/hw/rtc/goldfish_rtc.c
> @@ -211,6 +211,8 @@ static int goldfish_rtc_post_load(void *opaque, int version_id)
>              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      s->tick_offset = s->tick_offset_vmstate - delta;
>
> +    goldfish_rtc_set_alarm(s);
> +
>      return 0;
>  }
>
> --
> 2.26.2
>
>

