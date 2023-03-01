Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXW6s-0003iw-Jq
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 18:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXW6m-0003hj-S5
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 18:43:41 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXW6g-0004x7-VX
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 18:43:39 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso948524pjs.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 15:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677714213;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=64U/ZTou++lcAOyxylSvEnNVqwlVlBMljfv5hCd+Dew=;
 b=1cOrr1yVrNd100OCYZSuxZr/iCV9eDyAheI7QIAOhxbfsANh70BGs+BkB7Ioa462We
 OjBcZZOBIDjZsI2ranFfk36/RNMphbR6fHzKKKMEokxaqUvFFR/BuDq46Zxm4HEeCT4U
 dYOvofJhYoUBhqx42uQolnQl+LLFys+HcVwj+a77AdmDzcVk4qIyL8OwCtvu3fb9izEX
 ydPRW9bz8OPu5WZrja2BmcQprsGvvy1tkhEHm+jUwPmB2krtQsW/+DeTBsQrcbSvtR1O
 lUv10iwMJC2ixVbcY1MxbYOrHKvYqqySI2hQlyLNYwHKsYnCzjUsE23X9aIA/33whZMA
 wm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677714213;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64U/ZTou++lcAOyxylSvEnNVqwlVlBMljfv5hCd+Dew=;
 b=TAkcqY68QgqX6uZhQGKYSg73slpZPwbCSmoRUDa5ohQNZlePD3kFJTm3YYa9EgZXqa
 YdHOwGxDviXSxi8LKsOw1Ms+UNz47h+1RnkkU4Q+LD/jrA6A2xYgQHkPbznydV+Ovk8k
 ieoXlfgi4dSIYF7AbxNUiqMTKIvZFXHQsQoLYfFZO5n6wXLzm7dAa5KBX1+LWxmun+5d
 8njWWXSoOTXYC7rO3HeAiTgc3WPLAZqxydQjNX1slnCQkurYH1pl5VHhffbH2lVPGV6t
 1gjXzNWo1/gLhMPgJqjvJE1/Fm072aWLCneDSZDWqTzyhK0nWaeOB/q9L/hCRbyAYxTk
 RlHA==
X-Gm-Message-State: AO0yUKVKT8Z8gy9kCxyXfXOO1QjGiXwn5gAAM0iidJN7vyqB00OJ7tF+
 lBqVwX17EGMi+gwr9AFt4jSw57FWdYQsoHZZ
X-Google-Smtp-Source: AK7set8+AvW6HbShBlVzBp1jdZ46ga8t1H349NxfTzy/m/mbYG2MVJlcklvPVo2vJ359/UjxNIf5Ew==
X-Received: by 2002:a17:902:e886:b0:19d:b02:cca5 with SMTP id
 w6-20020a170902e88600b0019d0b02cca5mr8581377plg.12.1677714213051; 
 Wed, 01 Mar 2023 15:43:33 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 q19-20020a170902b11300b001963bc7bdb8sm8959050plr.274.2023.03.01.15.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 15:43:32 -0800 (PST)
Date: Wed, 01 Mar 2023 15:43:32 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 15:26:35 PST (-0800)
Subject: Re: [PATCH v2 00/14] target/riscv: Some updates to float point
 related extensions
In-Reply-To: <20230215020539.4788-1-liweiwei@iscas.ac.cn>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 liweiwei@iscas.ac.cn
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liweiwei@iscas.ac.cn
Message-ID: <mhng-0d453785-b4d3-46a2-ab41-6191c34f8b77@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 01 Mar 2023 23:43:42 -0000

On Tue, 14 Feb 2023 18:05:25 PST (-0800), liweiwei@iscas.ac.cn wrote:
> Specification for Zv* extensions can be found in:
>
> https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-zvfh-upstream-v2
>
> v2:
>
> * improve the error message for vector related check suggested by Daniel Henrique Barboza in patch 5
> * add similar simplification for check in csr.c/cpu_helper.c in patch 8
> * fix typos in commit messages
>
>
> Weiwei Li (14):
>   target/riscv: Fix the relationship between Zfhmin and Zfh
>   target/riscv: Fix the relationship between Zhinxmin and Zhinx
>   target/riscv: Simplify the check for Zfhmin and Zhinxmin
>   target/riscv: Add cfg properties for Zv* extensions
>   target/riscv: Fix relationship between V, Zve*, F and  D
>   target/riscv: Add propertie check for Zvfh{min} extensions
>   target/riscv: Indent fixes in cpu.c
>   target/riscv: Simplify check for Zve32f and Zve64f
>   target/riscv: Replace check for F/D to Zve32f/Zve64d in
>     trans_rvv.c.inc
>   target/riscv: Remove rebundunt check for zve32f and zve64f
>   target/riscv: Add support for Zvfh/zvfhmin extensions
>   target/riscv: Fix check for vector load/store instructions when EEW=64
>   target/riscv: Simplify check for EEW = 64 in trans_rvv.c.inc
>   target/riscv: Expose properties for Zv* extensions
>
>  target/riscv/cpu.c                        |  99 ++++++++----
>  target/riscv/cpu.h                        |   3 +
>  target/riscv/cpu_helper.c                 |   2 +-
>  target/riscv/csr.c                        |   3 +-
>  target/riscv/insn_trans/trans_rvv.c.inc   | 184 +++++++---------------
>  target/riscv/insn_trans/trans_rvzfh.c.inc |  25 ++-
>  6 files changed, 146 insertions(+), 170 deletions(-)

Thanks, I queued this up.  There were a few more spelling errors in the 
commit messages, I just cleaned those up while merging.

