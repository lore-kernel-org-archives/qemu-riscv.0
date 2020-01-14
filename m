Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irBr6-0004bK-T5
	for mharc-qemu-riscv@gnu.org; Mon, 13 Jan 2020 21:22:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1irBr4-0004aw-C8
 for qemu-riscv@nongnu.org; Mon, 13 Jan 2020 21:22:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1irBr3-0005hz-6v
 for qemu-riscv@nongnu.org; Mon, 13 Jan 2020 21:22:54 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37210)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1irBr2-0005gz-VP
 for qemu-riscv@nongnu.org; Mon, 13 Jan 2020 21:22:53 -0500
Received: by mail-pl1-x641.google.com with SMTP id c23so4599124plz.4
 for <qemu-riscv@nongnu.org>; Mon, 13 Jan 2020 18:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zaMRfDDkwZFafC/d7zTUCZiiLUs80i9tPo/guQhpPYk=;
 b=tG0k1okRg6PF/SUOmbHMDtEdrpNXFkRPk+u9qzpYNJ43OQ8wvBn1uqXbfL08GlvH0T
 K9nmsgiMPZMTxFAeGhsVvRBp179IAFsfSifJBiLw5TTd4+SVP7Th9mI5FyLnRR+qDmze
 9rHClOZLIhj7gw2QL06ccI4TxAutXski8ByfmpushqLuFJjuXzjIBHOiiZHls1A+7Ya2
 W5AcCYSyAMXWve4vf7TG48yKq4i6ydTGOhyugsa3bFmLwyKtjTcqJVF4N91PAaQQiS7D
 HminyQlKfV/gfa/jR8t1XeX3TjuTJhPFVqE7C2RRbUoAkORA/Lq3fdJgI1ye4r7XfJoa
 cxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zaMRfDDkwZFafC/d7zTUCZiiLUs80i9tPo/guQhpPYk=;
 b=Fl1S5ti9vzmhJaKKW46mIs1wb8b9Xb0Krn6tQgnhvtLm7JVyrI6zVvQezIigS8bKga
 74YslFobMIzEhJA8CWSreTSCy56+kSb/5aiIV93eMXfQ436TdbmPGxhvp17raYXBiCPF
 swux4lvFj5hR+p7OtupdvVxYa3hJ2JWsInSfcNrMx8D73FIrNXq5GWtf+tIp2p5sS9WA
 tpc090nVuRu7nIiNVdH1vE6bhGs1za5UzbED8H5PxjYYozXr+SHqCBGVn0/gxV9KGhuc
 AfME5R4S7srQFUY2IzNyj5+kSRvkC1/75t/8dDPPKeoFV3Ad42QuefjCuRdrxC2aTpfD
 9+EA==
X-Gm-Message-State: APjAAAWB4Ml8w2Ds29symFIU6W9j3HaPY5pefhODQ6B75rdwk5EgyDJS
 t9oG3dlzqp9LecTOcJIEXnEUVg==
X-Google-Smtp-Source: APXvYqyRBTBN/J+WLMJ0AlYXzTkOErUBjPWJfJHuqHHWbexG0x8xs7219Ho0pvGKongS+BbW4g6w9A==
X-Received: by 2002:a17:902:7406:: with SMTP id
 g6mr162776pll.103.1578968571659; 
 Mon, 13 Jan 2020 18:22:51 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id y38sm14853715pgk.33.2020.01.13.18.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 18:22:51 -0800 (PST)
Subject: Re: [PATCH 2/3] RISC-V: use FIELD macro to define tb flags
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, Alistair.Francis@wdc.com,
 palmer@dabbelt.com, chihmin.chao@sifive.com, jimw@sifive.com,
 bmeng.cn@gmail.com
Cc: wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com
References: <20200110081220.891-1-zhiwei_liu@c-sky.com>
 <20200110081220.891-2-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0df8de4c-b348-370f-bdd8-17a60f29505c@linaro.org>
Date: Mon, 13 Jan 2020 16:22:46 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200110081220.891-2-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Tue, 14 Jan 2020 02:22:55 -0000

On 1/9/20 10:12 PM, LIU Zhiwei wrote:
>      if (riscv_cpu_fp_enabled(env)) {
> -        *flags |= TB_FLAGS_MSTATUS_FS;
> +        flags = FIELD_DP32(flags, TB_FLAGS, FS, (env->mstatus & MSTATUS_FS));
>      }

This is wrong.  You're inserting the low two bits of

  env->mstatus & MSTATUS_FS

into TB_FLAGS.  Which, knowing that MSTATUS_FS == 0x6000, is of course always 0.

Because of how TB_FLAGS_MSTATUS_FS is defined, overlapping MSTATUS_FS, you
could just have

    *flags |= env->mstatus & MSTATUS_FS;


BTW, the *existing* code is wrong.  This merges all non-disabled states to
dirty.  This means that the code in mark_fs_dirty in translate.c that handles
initial and clean states is unreachable, and that the kernel's dirty state
tracking will not work.

Has the riscv kernel stopped doing lazy fp context switching?  I would imagine
that it has if this code is to be believed...

BTW2, for the purpose of tb_flags, initial and clean states are identical.  We
should probably fold them, to avoid generating two different TBs for the two
states.


r~

