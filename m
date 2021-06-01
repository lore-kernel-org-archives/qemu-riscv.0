Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnuGO-0005r0-Gw
	for mharc-qemu-riscv@gnu.org; Mon, 31 May 2021 22:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lnuGN-0005qc-3A; Mon, 31 May 2021 22:36:15 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:34309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lnuGL-0003ru-8p; Mon, 31 May 2021 22:36:14 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id 207so8884747ybd.1;
 Mon, 31 May 2021 19:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+MT/sHJHZUtRcvufixPou40U+W2Ff6v+4qzappYpnsM=;
 b=deWe3Im1RhuIVitRySksjnXsS1ezZYPrFSn6tdXu1SDSMjGlbUQdUZ0Pm09vVp1zqA
 Mu52zhB0hxZdrIozQ0ZrVE37P4aQVMQOpfrvN7gLiYIps+qiLpcyRxf0JQGM/bJ3k1JR
 TSF/vplllmu2XJto4dQWVgOdf9QHRayLDqd1VqNixNSlhUF5z0y78kKtFX7hJkxmuGsZ
 CcGCdaUaFpat6cJjb0CTSUh1Qynk2hchiKeHVU2BmPrE+i8LIJgYNCc5moeJCYusVFSS
 /qpQSSdHxNq6UMWQwqFqxu62CH2MNaQLjzY2ox8NE8t4fQ7dFaXXbb+LzWumL/tXcHDq
 eFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+MT/sHJHZUtRcvufixPou40U+W2Ff6v+4qzappYpnsM=;
 b=JZQQQvvjv8GBwosPDUubRdPyYj5CEJxAL7MmlWeMM5DAsG1GduvRFMzDcshiYcoqyy
 C2TXLObtNXgnDRpt2nj8F0ye/1sabl1QEToLAoBYo3/yQN9OFR1TvPc6MEsYHgix1uE1
 tbWuhlSlAVUIb/ilcsRMwclJ2zAsEQAjHXrhKHDvwQrX4g910C6B8eAgvKncktwjXoZD
 BSgUiJN4pwWK3ZdZSj1JGNTxlajEPRIB67/JgcGcjAfV9IbAMYjePT4Xz0HRSPEyY4I0
 g14IAhM0Ew6lglSdXGMM+VZIHVxs3yzUzmE7OBLjELxj948namC+1180Uva718tPVizg
 EliQ==
X-Gm-Message-State: AOAM532IalfCPrCwGxPBPqCFHoZMDReFkM6VQ9tZaTrgFAFWdMVSmFTB
 4rUXB7mGI3Koa/KiC5Owx6w60eTEIlZHkPOwlf8=
X-Google-Smtp-Source: ABdhPJxvKp9OIPOIVGfgwJd9wdka9ojFFKBc1v8KO5GWg9QB5zKdHrMDi//9Qbrz9mSU9q/CrIU6wQsOiUPD/mjxwKY=
X-Received: by 2002:a25:99c1:: with SMTP id q1mr33689658ybo.517.1622514971468; 
 Mon, 31 May 2021 19:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <0CAA9018-0C42-4140-82C1-EAC80D46D359@getmailspring.com>
 <CAEUhbmWnj3GOD5-EA54XHRQyfiSdOsH+KKGH-+uG0LEH+kAuUg@mail.gmail.com>
 <CA+Oz1=Z4J8KCHk_TZTUB9aEODaRv0F3bF6jtCHwdKQ02VgjcTQ@mail.gmail.com>
 <CAMSwOgoq5KNoU3aP6kGZxAVhj_phxJvmCWb=6dKB7SkbXjaJyQ@mail.gmail.com>
In-Reply-To: <CAMSwOgoq5KNoU3aP6kGZxAVhj_phxJvmCWb=6dKB7SkbXjaJyQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 1 Jun 2021 10:36:00 +0800
Message-ID: <CAEUhbmWCvPVo5Jww0GPb6uX0xBfRKqZD6Jp-e54sU+v6R=m3gQ@mail.gmail.com>
Subject: Re: HSS Issue with GCC 10, Qemu Setup for microchip-icicle-kit
To: Rahul Pathak <rpathakmailbox@gmail.com>
Cc: Rahul Pathak <rpathak@ventanamicro.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 01 Jun 2021 02:36:15 -0000

Hi Rahul,

On Mon, May 31, 2021 at 10:43 PM Rahul Pathak <rpathakmailbox@gmail.com> wrote:
>
> On top of that, it seems I cannot connect with the target using gdb
>
> (gdb) target remote :1234
> Remote debugging using :1234
> bfd requires flen 8, but target has flen 0
>
> Though the ABI is lp64 and ISA is rv64imac when the hss was built.
>

Did you feed gdb the image you wanted to debug before "target remote:"?

The PolarFire SoC has 1+4 HARTs and you should follow the instructions
@ https://wiki.qemu.org/Documentation/Platforms/RISCV#Attaching_GDB to
do the debug.

Regards,
Bin

