Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCzp8-0003Rs-Df
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 01:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33640)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCzp5-0003RL-6c
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 01:59:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCzp4-0004ib-1u
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 01:58:58 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36240)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCzp3-0004fz-TF
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 01:58:57 -0400
Received: by mail-pf1-x441.google.com with SMTP id i13so6593703pfe.3
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 22:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V7mxmz7uXlCpgsnx481z7pPV9h406Rzi/xQp8Vpx5tY=;
 b=vCemA9dYRCDkz2KG1MpVf3VTvWNEtZcNrH/8i09cWpylKwow7bCL0xBgU5Kd4ZaHou
 3w4bemZb2IZzMitjVgGNKvx+hAC+I1WoHLbtdFcEQkO7ftreMSE5knb0bNMebkYHbdyo
 meKK8bzZ59l8tqiWXMP8vamSyU9aHkS1SLX9PXiWe7hwKw5Ajol76EW/qSfQL7zhFson
 7ksPN9e/EWf8+XM0t8Y10bJzjk0M52QGAknSYSacDhWdF1IavKGbxwvgSl/D9N/QSRqh
 IlC37xdZN22XhvjGfwBa91ZY1dDl1HPPhM3wPQmZyJnm7NbSwaUDlg86CYmMXHL87c/o
 39Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V7mxmz7uXlCpgsnx481z7pPV9h406Rzi/xQp8Vpx5tY=;
 b=SvLPt6m3JAhmaQNBn3eZIcEL1dxuVOzXBmonTSvAWm2Y2jZRyYgXKbC3DcbbJYq+CW
 RIbAzYDcushnMNtBTTR9K2nNP7NOZYzc++METrEPocKtd5wh/bDIbkIfJYE+sKsUoAeu
 TwmA/NTkMoMrfhi27/hn53TqrXcKXe2KiKsUTDzggMLEL5u60LtTTBYnH7slKdID6qkE
 YG0c61wZFgptv0knR8cjQ5f4bKHx9D4Hj/1s78tQ9lx8a+Esxa06pQ9FTeV0eWVef17H
 6CYfOtveNiDnySmtMWwLXu6LBXC1/QO8sZq1ZHeMqesfzX9TGje9bc3we5hRXVsqk5IX
 vEQg==
X-Gm-Message-State: ANhLgQ2fvT07MNz/GqcVkBPxn9iwg49krOGiXvwhs9qqp4MvArKXyxZv
 qFLIcD1TiKPEdhf3TlrbXwGViEaRfcU=
X-Google-Smtp-Source: ADFU+vvJ14bynRBoOHoC6Iwb4oJKDggsqYkBWFLg7m6T93ri3N2L01gtkvhfltDStVs2WLP90dsdcA==
X-Received: by 2002:aa7:9d0a:: with SMTP id k10mr15910027pfp.266.1584165536493; 
 Fri, 13 Mar 2020 22:58:56 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 b70sm20344029pfb.6.2020.03.13.22.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 22:58:55 -0700 (PDT)
Subject: Re: [PATCH v5 11/60] target/riscv: vector integer add-with-carry /
 subtract-with-borrow instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-12-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <77fcc875-ba5e-ea18-1228-6a1e7989491b@linaro.org>
Date: Fri, 13 Mar 2020 22:58:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-12-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
X-List-Received-Date: Sat, 14 Mar 2020 05:59:00 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +#define DO_MADC(N, M, C) ((__typeof(N))(N + M + C) < N ? 1 : 0)

Incorrect.  E.g N = 1, M = UINT_MAX, C = 1, adds to 1, which is not less than
N, despite the carry-out.

You want

    C ? N + M <= N : N + M < N

> +#define DO_MSBC(N, M, C) ((__typeof(N))(N - M - C) > N ? 1 : 0)

Similarly

    C ? N <= M : N < M


r~

