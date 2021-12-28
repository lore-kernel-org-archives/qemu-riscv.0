Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n29oF-0005D4-M3
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 05:34:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n29o7-00059d-BE
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 05:34:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n29o4-0000DJ-8b
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 05:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640687651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z6hMnATLglnqwTZoiWpQq1tnAqHOHJxZqhiIwHJuN1w=;
 b=FIk5hbNeyyA25WjRI9TunZoK/uMIsC+fNDAK6SLOogpm4DeymOUs1/zQQjon/3h28jFccy
 6eFUb78CdLBXfC8yOk3fFzcGOplaT9bUL5KTV2e3qhXKNDOGa4wvMU6nAhcVX+7Ae9dvoL
 J6HeywUpYJjArwBpbKdgeMlnWCRNxK4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-NBFqcItuM8ylz6lI4VuFLg-1; Tue, 28 Dec 2021 05:34:10 -0500
X-MC-Unique: NBFqcItuM8ylz6lI4VuFLg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c511200b00345c1603997so4906101wms.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 02:34:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z6hMnATLglnqwTZoiWpQq1tnAqHOHJxZqhiIwHJuN1w=;
 b=JhUxk0vQdz7USlTH1xX9RJsxLi4wJ02VyHhGsRAmAOuc3z0hb2EnHUSW3xVuRg3zWr
 e+hlz7crA7ZIMxEMCvxlBqQ3fdYorEiBR5392XHhh67AplWF8PUQn16Z/+KurbapQUod
 eIykVOqQVe2vbg6wbEOCLruKttPpEZ5KsTzDTRin8RS6nqKZKnQz5qBSE+caLWe6V7UY
 +wHXHGcC7Y8q3slF1WJNpdnL+ulfgHZ1AtN5buCHJp8HR/nZIPGOA7BCskfxygLEfC35
 ACzdX8BRXaecoBbCSuyP2Hem8GfU5ul4/GuCppA8br2Dny4ddYNAcOpQlmx39ewZaYAd
 V1fw==
X-Gm-Message-State: AOAM533e6GqLjvJQJwXPWjrfXQj5odOjDUlEMY7BzIsc8UK+xcZXI8Gl
 U/yshlAfARZieOiSPH50zIITZvIatamCCdI8f+lHeaoKpNAHncBM4ENWE44eObxJqBBMIcMKNq8
 XQ+6zjx7ggZEg9v8=
X-Received: by 2002:a05:600c:3583:: with SMTP id
 p3mr16672977wmq.180.1640687648023; 
 Tue, 28 Dec 2021 02:34:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyn4E8HqS2uKgc9pcBxNYsDsCjOA8koUNGCaQEBiJ011KspbAH2JvTJjuxvfvMRRA/2L3PnoQ==
X-Received: by 2002:a05:600c:3583:: with SMTP id
 p3mr16672944wmq.180.1640687647714; 
 Tue, 28 Dec 2021 02:34:07 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id u3sm22834762wrs.0.2021.12.28.02.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 02:34:07 -0800 (PST)
Message-ID: <3aba5b46-9b2a-0270-2b4d-8384b012a0f0@redhat.com>
Date: Tue, 28 Dec 2021 11:33:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] hw/dma: sifive_pdma: support high 32-bit access of
 64-bit register
To: Jim Shu <jim.shu@sifive.com>, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com, frank.chang@sifive.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20211228005236.415583-1-jim.shu@sifive.com>
 <20211228005236.415583-2-jim.shu@sifive.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228005236.415583-2-jim.shu@sifive.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.573,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 28 Dec 2021 10:34:17 -0000

Hi Jim and Frank,

On 12/28/21 01:52, Jim Shu wrote:
> Real PDMA support high 32-bit read/write memory access of 64-bit
> register.
> 
> The following result is PDMA tested in U-Boot on Unmatched board:
> 
> 1. Real PDMA is allowed high 32-bit read/write to 64-bit register.
> => mw.l 0x3000000 0x0                      <= Disclaim channel 0
> => mw.l 0x3000000 0x1                      <= Claim channel 0
> => mw.l 0x3000010 0x80000000               <= Write low 32-bit NextDest (NextDest = 0x280000000)
> => mw.l 0x3000014 0x2                      <= Write high 32-bit NextDest
> => md.l 0x3000010 1                        <= Dump low 32-bit NextDest
> 03000010: 80000000
> => md.l 0x3000014 1                        <= Dump high 32-bit NextDest
> 03000014: 00000002
> => mw.l 0x3000018 0x80001000               <= Write low 32-bit NextSrc (NextSrc = 0x280001000)
> => mw.l 0x300001c 0x2                      <= Write high 32-bit NextSrc
> => md.l 0x3000018 1                        <= Dump low 32-bit NextSrc
> 03000010: 80001000
> => md.l 0x300001c 1                        <= Dump high 32-bit NextSrc
> 03000014: 00000002
> 
> 2. PDMA transfer from 0x280001000 to 0x280000000 is OK.
> => mw.q 0x3000008 0x4                      <= NextBytes = 4
> => mw.l 0x3000004 0x22000000               <= wsize = rsize = 2 (2^2 = 4 bytes)
> => mw.l 0x280000000 0x87654321             <= Fill test data to dst
> => mw.l 0x280001000 0x12345678             <= Fill test data to src
> => md.l 0x280000000 1; md.l 0x280001000 1  <= Dump src/dst memory contents
> 280000000: 87654321                              !Ce.
> 280001000: 12345678                              xV4.
> => md.l 0x3000000 8                        <= Dump PDMA status
> 03000000: 00000001 22000000 00000004 00000000    ......."........
> 03000010: 80000000 00000002 80001000 00000002    ................
> => mw.l 0x3000000 0x3                      <= Set channel 0 run and claim bits
> => md.l 0x3000000 8                        <= Dump PDMA status
> 03000000: 40000001 22000000 00000004 00000000    ...@..."........
> 03000010: 80000000 00000002 80001000 00000002    ................
> => md.l 0x280000000 1; md.l 0x280001000 1  <= Dump src/dst memory contents
> 280000000: 12345678                               xV4.
> 280001000: 12345678                               xV4.
> 
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>  hw/dma/sifive_pdma.c | 174 +++++++++++++++++++++++++++++++++++++------
>  1 file changed, 152 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> index 85fe34f5f3..b8b198ab4e 100644
> --- a/hw/dma/sifive_pdma.c
> +++ b/hw/dma/sifive_pdma.c
> @@ -177,18 +177,44 @@ static inline void sifive_pdma_update_irq(SiFivePDMAState *s, int ch)
>      s->chan[ch].state = DMA_CHAN_STATE_IDLE;
>  }
>  
> -static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned size)
> +static uint64_t sifive_pdma_readq(SiFivePDMAState *s, int ch, hwaddr offset)
>  {
> -    SiFivePDMAState *s = opaque;
> -    int ch = SIFIVE_PDMA_CHAN_NO(offset);
>      uint64_t val = 0;
>  
> -    if (ch >= SIFIVE_PDMA_CHANS) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
> -                      __func__, ch);
> -        return 0;
> +    offset &= 0xfff;
> +    switch (offset) {
> +    case DMA_NEXT_BYTES:
> +        val = s->chan[ch].next_bytes;
> +        break;
> +    case DMA_NEXT_DST:
> +        val = s->chan[ch].next_dst;
> +        break;
> +    case DMA_NEXT_SRC:
> +        val = s->chan[ch].next_src;
> +        break;
> +    case DMA_EXEC_BYTES:
> +        val = s->chan[ch].exec_bytes;
> +        break;
> +    case DMA_EXEC_DST:
> +        val = s->chan[ch].exec_dst;
> +        break;
> +    case DMA_EXEC_SRC:
> +        val = s->chan[ch].exec_src;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Unexpected 64-bit access to 0x%" HWADDR_PRIX "\n",
> +                      __func__, offset);
> +        break;
>      }
>  
> +    return val;
> +}
> +
> +static uint32_t sifive_pdma_readl(SiFivePDMAState *s, int ch, hwaddr offset)
> +{
> +    uint32_t val = 0;
> +
>      offset &= 0xfff;
>      switch (offset) {
>      case DMA_CONTROL:
> @@ -198,28 +224,47 @@ static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned size)
>          val = s->chan[ch].next_config;
>          break;
>      case DMA_NEXT_BYTES:
> -        val = s->chan[ch].next_bytes;
> +        val = extract64(s->chan[ch].next_bytes, 0, 32);
> +        break;
> +    case DMA_NEXT_BYTES + 4:
> +        val = extract64(s->chan[ch].next_bytes, 32, 32);
>          break;
>      case DMA_NEXT_DST:
> -        val = s->chan[ch].next_dst;
> +        val = extract64(s->chan[ch].next_dst, 0, 32);
> +        break;
> +    case DMA_NEXT_DST + 4:
> +        val = extract64(s->chan[ch].next_dst, 32, 32);
>          break;
>      case DMA_NEXT_SRC:
> -        val = s->chan[ch].next_src;
> +        val = extract64(s->chan[ch].next_src, 0, 32);
> +        break;
> +    case DMA_NEXT_SRC + 4:
> +        val = extract64(s->chan[ch].next_src, 32, 32);
>          break;
>      case DMA_EXEC_CONFIG:
>          val = s->chan[ch].exec_config;
>          break;
>      case DMA_EXEC_BYTES:
> -        val = s->chan[ch].exec_bytes;
> +        val = extract64(s->chan[ch].exec_bytes, 0, 32);
> +        break;
> +    case DMA_EXEC_BYTES + 4:
> +        val = extract64(s->chan[ch].exec_bytes, 32, 32);
>          break;
>      case DMA_EXEC_DST:
> -        val = s->chan[ch].exec_dst;
> +        val = extract64(s->chan[ch].exec_dst, 0, 32);
> +        break;
> +    case DMA_EXEC_DST + 4:
> +        val = extract64(s->chan[ch].exec_dst, 32, 32);
>          break;
>      case DMA_EXEC_SRC:
> -        val = s->chan[ch].exec_src;
> +        val = extract64(s->chan[ch].exec_src, 0, 32);
> +        break;
> +    case DMA_EXEC_SRC + 4:
> +        val = extract64(s->chan[ch].exec_src, 32, 32);
>          break;
>      default:
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Unexpected 32-bit access to 0x%" HWADDR_PRIX "\n",
>                        __func__, offset);
>          break;
>      }
> @@ -227,19 +272,66 @@ static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned size)
>      return val;
>  }
>  
> -static void sifive_pdma_write(void *opaque, hwaddr offset,
> -                              uint64_t value, unsigned size)
> +static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned size)
>  {
>      SiFivePDMAState *s = opaque;
>      int ch = SIFIVE_PDMA_CHAN_NO(offset);
> -    bool claimed, run;
> +    uint64_t val = 0;
>  
>      if (ch >= SIFIVE_PDMA_CHANS) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
>                        __func__, ch);
> -        return;
> +        return 0;
> +    }
> +
> +    switch (size) {
> +    case 8:
> +        val = sifive_pdma_readq(s, ch, offset);
> +        break;
> +    case 4:
> +        val = sifive_pdma_readl(s, ch, offset);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid read size %u to PDMA\n",
> +                      __func__, size);
> +        return 0;
>      }
>  
> +    return val;
> +}
> +
> +static void sifive_pdma_writeq(SiFivePDMAState *s, int ch,
> +                               hwaddr offset, uint64_t value)
> +{
> +    offset &= 0xfff;
> +    switch (offset) {
> +    case DMA_NEXT_BYTES:
> +        s->chan[ch].next_bytes = value;
> +        break;
> +    case DMA_NEXT_DST:
> +        s->chan[ch].next_dst = value;
> +        break;
> +    case DMA_NEXT_SRC:
> +        s->chan[ch].next_src = value;
> +        break;
> +    case DMA_EXEC_BYTES:
> +    case DMA_EXEC_DST:
> +    case DMA_EXEC_SRC:
> +        /* these are read-only registers */
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Unexpected 64-bit access to 0x%" HWADDR_PRIX "\n",
> +                      __func__, offset);
> +        break;
> +    }
> +}
> +
> +static void sifive_pdma_writel(SiFivePDMAState *s, int ch,
> +                               hwaddr offset, uint32_t value)
> +{
> +    bool claimed, run;
> +
>      offset &= 0xfff;
>      switch (offset) {
>      case DMA_CONTROL:
> @@ -282,13 +374,24 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
>          s->chan[ch].next_config = value;
>          break;
>      case DMA_NEXT_BYTES:
> -        s->chan[ch].next_bytes = value;
> +        s->chan[ch].next_bytes =
> +            deposit64(s->chan[ch].next_bytes, 0, 32, value);
> +        break;
> +    case DMA_NEXT_BYTES + 4:
> +        s->chan[ch].next_bytes =
> +            deposit64(s->chan[ch].next_bytes, 32, 32, value);
>          break;
>      case DMA_NEXT_DST:
> -        s->chan[ch].next_dst = value;
> +        s->chan[ch].next_dst = deposit64(s->chan[ch].next_dst, 0, 32, value);
> +        break;
> +    case DMA_NEXT_DST + 4:
> +        s->chan[ch].next_dst = deposit64(s->chan[ch].next_dst, 32, 32, value);
>          break;
>      case DMA_NEXT_SRC:
> -        s->chan[ch].next_src = value;
> +        s->chan[ch].next_src = deposit64(s->chan[ch].next_src, 0, 32, value);
> +        break;
> +    case DMA_NEXT_SRC + 4:
> +        s->chan[ch].next_src = deposit64(s->chan[ch].next_src, 32, 32, value);
>          break;
>      case DMA_EXEC_CONFIG:
>      case DMA_EXEC_BYTES:
> @@ -297,12 +400,39 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
>          /* these are read-only registers */
>          break;
>      default:
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Unexpected 32-bit access to 0x%" HWADDR_PRIX "\n",
>                        __func__, offset);
>          break;
>      }
>  }
>  
> +static void sifive_pdma_write(void *opaque, hwaddr offset,
> +                              uint64_t value, unsigned size)
> +{
> +    SiFivePDMAState *s = opaque;
> +    int ch = SIFIVE_PDMA_CHAN_NO(offset);
> +
> +    if (ch >= SIFIVE_PDMA_CHANS) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
> +                      __func__, ch);
> +        return;
> +    }
> +
> +    switch (size) {
> +    case 8:
> +        sifive_pdma_writeq(s, ch, offset, value);
> +        break;
> +    case 4:
> +        sifive_pdma_writel(s, ch, offset, (uint32_t) value);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid write size %u to PDMA\n",
> +                      __func__, size);
> +        break;
> +    }
> +}
> +
>  static const MemoryRegionOps sifive_pdma_ops = {
>      .read = sifive_pdma_read,
>      .write = sifive_pdma_write,

Would this work instead?

-- >8 --
diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index 85fe34f5f31..8f879de6f60 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -308,10 +308,14 @@ static const MemoryRegionOps sifive_pdma_ops = {
     .write = sifive_pdma_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     /* there are 32-bit and 64-bit wide registers */
-    .impl = {
+    .valid = {
         .min_access_size = 4,
         .max_access_size = 8,
     }
+    .impl = {
+        .min_access_size = 8,
+        .max_access_size = 8,
+    }
 };

---


