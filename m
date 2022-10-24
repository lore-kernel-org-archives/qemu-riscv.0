Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1omo6E-0006eA-79
	for mharc-qemu-riscv@gnu.org; Sun, 23 Oct 2022 23:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1omo6A-0006aF-G5; Sun, 23 Oct 2022 23:26:01 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1omo5o-0001Zj-MS; Sun, 23 Oct 2022 23:25:46 -0400
Received: by mail-pl1-x636.google.com with SMTP id p3so6491505pld.10;
 Sun, 23 Oct 2022 20:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5rjPEz86fPIHcidXh5wqatbRTv+juo3Cx/ntGnvnqXE=;
 b=BOpMaLdzRkU4/r5TQyuDY5QlWAO69KvKKt49k3IgNHFXphmF1P0yhbm3pBa2q5inO+
 FKk21wEkUqTIFEOLDHNkSISf6+L7sSxXPh1miePMkswiEy16teHlosjtKKbQ2rRaxHj/
 RTeOPsTN72J5i62dU7C4nSOimgnULzCLlqnJKp8jj5fu/yPaI46wGW97rmnT9NJP5Go3
 H4euNItjzSfOGOcqATReaAtspD7dBbNDcoAXVkZAr3Ni/M651Is1Y9gxvbRv2AHAHjcz
 KTwYoGbd9pmCrFV7SjmIjzPL1ellSH6yFAI47dLtDMlcvJstKEgM2u94/Su8mVSltm9k
 YjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5rjPEz86fPIHcidXh5wqatbRTv+juo3Cx/ntGnvnqXE=;
 b=2rCXDe7lBV8GA1VraVp7Uv2eEfiPNMNZBHJ26WmkpUjFLXfhNRklzosSMMOlHizo7a
 xIhZMgV5n5GdOWUoTVDMVZXfnnokpjPYaJoCRIg7sikl8hiwgzsOw5nYGFxazgHqGixb
 GIOBLX0fBDi6fHp1rB6mOnSBoKbMKX6jdv74whoOfAP6m03yV8aEzP7qyV+QI3l5Fey9
 bhd3S/Um89bRu/VZHYpZsfgmtvnpeOFCMGPCY97q0x90+EdjQhv5rf8J/M480mjlnftI
 2Ll1FejWQIkFvpXxk7LPPGPSXsYdCJpUWxOcmBf9Y3E3JnpwbMfPzgvJTVi9OUtfs3Ne
 sAZg==
X-Gm-Message-State: ACrzQf0AJCRWquTrPKtCj9IYkEPyeV67L4Fam5Gy/eWnr63snrFBifNL
 /pLh3Z//1Wbn/vHMPPOcu+aikvQnzXh/ZqKolGI=
X-Google-Smtp-Source: AMsMyM7Gs/uhUcbdzZx4BvCkYwRnLYwQAG+Sj+SPHLBlG1ig8V4q6jNdcVQCvrDxMbpCN3ClWymNUzoC09Z3KEut7M0=
X-Received: by 2002:a17:902:8693:b0:17a:f71:98fd with SMTP id
 g19-20020a170902869300b0017a0f7198fdmr31522116plo.25.1666581934711; Sun, 23
 Oct 2022 20:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221017054950.317584-1-wilfred.mallawa@opensource.wdc.com>
 <20221017054950.317584-3-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20221017054950.317584-3-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Oct 2022 13:25:08 +1000
Message-ID: <CAKmqyKOZ9_kyvuEjTeMVADbAY35NwVpe8y+oFPDR-shi_n5UMA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hw/ssi/ibex_spi: implement `FIELD32_1CLEAR` macro
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: alistair@alistair23.me, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Mon, 24 Oct 2022 03:26:01 -0000

On Mon, Oct 17, 2022 at 3:55 PM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> use the `FIELD32_1CLEAR` macro to implement register
> `rw1c` functionality to `ibex_spi`.
>
> This change was tested by running the `SPI_HOST` from TockOS.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/ibex_spi_host.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
> index 57df462e3c..0a456cd1ed 100644
> --- a/hw/ssi/ibex_spi_host.c
> +++ b/hw/ssi/ibex_spi_host.c
> @@ -342,7 +342,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>  {
>      IbexSPIHostState *s = opaque;
>      uint32_t val32 = val64;
> -    uint32_t shift_mask = 0xff, status = 0, data = 0;
> +    uint32_t shift_mask = 0xff, status = 0;
>      uint8_t txqd_len;
>
>      trace_ibex_spi_host_write(addr, size, val64);
> @@ -355,12 +355,11 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>      case IBEX_SPI_HOST_INTR_STATE:
>          /* rw1c status register */
>          if (FIELD_EX32(val32, INTR_STATE, ERROR)) {
> -            data = FIELD_DP32(data, INTR_STATE, ERROR, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], INTR_STATE, ERROR);
>          }
>          if (FIELD_EX32(val32, INTR_STATE, SPI_EVENT)) {
> -            data = FIELD_DP32(data, INTR_STATE, SPI_EVENT, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], INTR_STATE, SPI_EVENT);
>          }
> -        s->regs[addr] = data;
>          break;
>      case IBEX_SPI_HOST_INTR_ENABLE:
>          s->regs[addr] = val32;
> @@ -505,27 +504,25 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>       *  When an error occurs, the corresponding bit must be cleared
>       *  here before issuing any further commands
>       */
> -        status = s->regs[addr];
>          /* rw1c status register */
>          if (FIELD_EX32(val32, ERROR_STATUS, CMDBUSY)) {
> -            status = FIELD_DP32(status, ERROR_STATUS, CMDBUSY, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS, CMDBUSY);
>          }
>          if (FIELD_EX32(val32, ERROR_STATUS, OVERFLOW)) {
> -            status = FIELD_DP32(status, ERROR_STATUS, OVERFLOW, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS, OVERFLOW);
>          }
>          if (FIELD_EX32(val32, ERROR_STATUS, UNDERFLOW)) {
> -            status = FIELD_DP32(status, ERROR_STATUS, UNDERFLOW, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS, UNDERFLOW);
>          }
>          if (FIELD_EX32(val32, ERROR_STATUS, CMDINVAL)) {
> -            status = FIELD_DP32(status, ERROR_STATUS, CMDINVAL, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS, CMDINVAL);
>          }
>          if (FIELD_EX32(val32, ERROR_STATUS, CSIDINVAL)) {
> -            status = FIELD_DP32(status, ERROR_STATUS, CSIDINVAL, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS, CSIDINVAL);
>          }
>          if (FIELD_EX32(val32, ERROR_STATUS, ACCESSINVAL)) {
> -            status = FIELD_DP32(status, ERROR_STATUS, ACCESSINVAL, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS, ACCESSINVAL);
>          }
> -        s->regs[addr] = status;
>          break;
>      case IBEX_SPI_HOST_EVENT_ENABLE:
>      /* Controls which classes of SPI events raise an interrupt. */
> --
> 2.37.3
>
>

