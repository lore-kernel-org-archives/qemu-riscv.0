Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kecuY-0007aj-9H
	for mharc-qemu-riscv@gnu.org; Mon, 16 Nov 2020 06:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1kecuW-0007Yq-OJ
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2020 06:43:04 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1kecuV-0005Fw-3b
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2020 06:43:04 -0500
Received: by mail-wr1-x441.google.com with SMTP id p1so18302578wrf.12
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2020 03:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version; bh=0rXA8XZn7JkWwVstde3HldUwSc7whHaNTQ9ecd8UQZ4=;
 b=bez9Ev+jt6QIFIyJlrOJi44jl1sk33LV8RkSqun/AP1yn9rnO6qRjLhOHcUX/+VRK2
 dbZ6EqYm2wIEBK4zBrAoC4DbJ416juUeEJ3HAZe3f5YyCNH7im4fWlmN+xGuWuYI9Y4w
 HowmNMx+Jr2WwOdyXY5jNOUsmq/IL4a4PczbhuvYqcUpFJ/Kl8SkPIcX9rWbO3r7Rk12
 PaAoDXgP133nJXRRV0J+9ywuxV8dvgDSOmPRTXxLO69DQ1ZlxBGFqRe/QO/L3Qjw4pVN
 yExm9Mzc+H/SqiAmcGHH244FXwfp29SUkgTvPd7QsZ23mhe92r51bXgoWtFGQRjWFq2+
 fpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version;
 bh=0rXA8XZn7JkWwVstde3HldUwSc7whHaNTQ9ecd8UQZ4=;
 b=LKzczW/VPa3ohZT3pyip898TkbT+wZJX6tCaEmf70qiN568/99gRNyOF88nvZCL2b/
 rrlyelvIdj2iWfPGSX24T1Wms/4sXPae4CYSLNlVoVus2037ksnulNRsYDy7q3lekna9
 z7u3yKcCHDEcFxDi5kRvEF08/xcBII4jgY6I2dVm9Ch4jIWjAZ3dUq++PvAEq0vrYVC4
 GN6QcHD38pZgOiejXMs2DjeIC63z+ulf29SYwd/o4BahGTT/TVdFPwxpOYmdhqKUeo15
 M8lwRdSOG3A0UnaQ6lhYIfcFUu863FYgek8hP2KTegKRLK6gLtOoXvnpDJcg6pyQI6Qm
 b3mA==
X-Gm-Message-State: AOAM531N5YwsNlng/oVBRH/jwbc/ifpibJLoNQqHjwTD99D53e4+aLNe
 B1+NAdW5TEsbBOp6hnIqeubPxQb+9mvuF9/H
X-Google-Smtp-Source: ABdhPJy0RE9RlVzw9rGFyO3bzrCCcLoKdTgFAfhpqHjWUFO9PqwKUoS/h3rMZ4H5ExN0KsaCDO7YjA==
X-Received: by 2002:adf:9124:: with SMTP id j33mr18140459wrj.376.1605526980807; 
 Mon, 16 Nov 2020 03:43:00 -0800 (PST)
Received: from [192.168.2.1] (net.iroazh.eu. [109.190.73.171])
 by smtp.gmail.com with ESMTPSA id 36sm6158411wrf.94.2020.11.16.03.42.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Nov 2020 03:43:00 -0800 (PST)
From: "Emmanuel Blot" <emmanuel.blot@sifive.com>
To: qemu-riscv@nongnu.org
Cc: "Alistair Francis" <Alistair.Francis@wdc.com>
Subject: Re: [PATCH 0/1] CLINT timebase frequency is invalid for sifive
 machines
Date: Mon, 16 Nov 2020 12:42:58 +0100
X-Mailer: MailMate (1.13.2r5673)
Message-ID: <F8D11E62-3FF4-45F9-8EFA-303228B55808@sifive.com>
In-Reply-To: <20201103153844.91458-1-emmanuel.blot@sifive.com>
References: <20201103153844.91458-1-emmanuel.blot@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; markup=markdown
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=emmanuel.blot@sifive.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 16 Nov 2020 11:43:05 -0000

On 3 Nov 2020, at 16:38, Emmanuel Blot wrote:

ping

> CLINT mtime is a 64-bit read-write register that contains the number 
> of cycles
> counted from the rtcclk input. rtcclk clock for sifive machines is 
> currently
> defined as 10MHz, while the real HW use a 32.768KHz RTC clock source 
> on FU310
> (sifive_e) and 1MHz on FU540 (sifive_u).
>
> Emmanuel Blot (1):
>   hw/riscv: clint: timebase-freq is machine-specific
>
>  hw/riscv/sifive_e.c            | 2 +-
>  hw/riscv/sifive_u.c            | 4 ++--
>  hw/riscv/spike.c               | 4 ++--
>  hw/riscv/virt.c                | 4 ++--
>  include/hw/intc/sifive_clint.h | 4 ----
>  include/hw/riscv/sifive_e.h    | 2 ++
>  include/hw/riscv/sifive_u.h    | 2 ++
>  include/hw/riscv/spike.h       | 2 ++
>  include/hw/riscv/virt.h        | 2 ++
>  9 files changed, 15 insertions(+), 11 deletions(-)
>
> -- 
> 2.28.0

