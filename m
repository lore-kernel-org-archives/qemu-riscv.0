Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDGXA-0002os-EF
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 19:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42945)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDGX7-0002oV-LY
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:49:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDGX6-0000rF-OF
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:49:33 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:40030)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDGX6-0000nz-Ij
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:49:32 -0400
Received: by mail-pj1-x1042.google.com with SMTP id bo3so4856668pjb.5
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 16:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vnVePBa1aHYXXk2MUCRDLoPKiQn8rBG94p7anAPutsM=;
 b=EDe3o18DGTYOAwVU6+j7I59m2cw7264zEmL2VuvYN2hZgiAzufrJ2ri4apShP4xfWD
 H58ZRp4Gdg8ROgBBzGJoDU3WPiBm42N9p20DX5EGaGqmrKZM3BUb/oAjB85LMI5UhjTJ
 F1QKoGcs9Ht2UmVx4CqK97xiyifnYDJrjTLoXmahHvYYnel840VmRrhTVKCGb42YtF8U
 p2NLjIcE9Cu955Uq8WPtOf/f7RdTdcObfzTIZJCQ0qAUdBbBMnfliMwb+1yMt99+UFbf
 YGq7PXgtleP7bQLyQBUljbi0x56epIMbqv7CfBLiUv3VVF62Z24FEI4qrmamnt0+E5JJ
 3ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vnVePBa1aHYXXk2MUCRDLoPKiQn8rBG94p7anAPutsM=;
 b=LoH/msE3PH0SEJl6T7TJOUAiOitw7LEueAnEmQbIQuyNrZ9FxJzGv5gBC/TjOIu0i/
 UI9stMMKzU1dnf9ApvdQFo5cQcHZzCsW/4vy4rp0t/pesd7/rc6ncz3P1OnWlbpzOOV6
 ry473hSuNPE7Ajz+L1/Q2eeEynIIw6f8MlDHvN5BNOOz+17N4qRiBCinmwGGQlPPyUD6
 NanFV5gX487NgMsCY82VSPNC+ysQoT4PGqHlB7FV7NQRFJM33NKSbzERH27IXqnG0Kw/
 ihNcE8S+gQR4lbfSSZIu4aEgo5mfVV7IIgCpmcyMi0ll9XJU4TrSqoztHPVJUnWDoQgV
 We3Q==
X-Gm-Message-State: ANhLgQ1D1S3OF4EMpUeEwDecH81gG+3nz+V6LgLFu5N5W3+pp+IMyrU9
 +tDapfAMLVPcUsRlGTWipnfBQREVYJM=
X-Google-Smtp-Source: ADFU+vuO73eOUfkSqESCtk6hFBLZ+6us9KfEdvIc179/AAKDr/NV5v0mptEvKJvauTUKWRCjL2qKoQ==
X-Received: by 2002:a17:902:b485:: with SMTP id
 y5mr18960158plr.4.1584229771341; 
 Sat, 14 Mar 2020 16:49:31 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 e28sm60899937pgn.21.2020.03.14.16.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 16:49:30 -0700 (PDT)
Subject: Re: [PATCH v5 47/60] target/riscv: vector widening floating-point
 reduction instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-48-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <843f39db-21df-37cf-cdbd-ae6b08aa9b0c@linaro.org>
Date: Sat, 14 Mar 2020 16:49:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-48-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-List-Received-Date: Sat, 14 Mar 2020 23:49:34 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  3 ++
>  target/riscv/insn32.decode              |  2 +
>  target/riscv/insn_trans/trans_rvv.inc.c |  3 ++
>  target/riscv/vector_helper.c            | 50 +++++++++++++++++++++++++
>  4 files changed, 58 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


