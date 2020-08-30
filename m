Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCCb0-0004l2-B7
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 21:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCCay-0004k2-CV
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 21:57:24 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:43741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCCaw-0007mu-JP
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 21:57:23 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y206so2641048pfb.10
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 18:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yyrx3sNY97qpxZofH/wQKp6HlhF94w1O2QAMnNFBt/M=;
 b=uVAgYrUJQuBGLM4Y0r5+z59/YWpkx/ECCma1rKaXN+JCtaMu0NjgEHaUfbgRVBV6Qz
 BTAKFGOcccJy8bE/R7yj9ef6lV0dshZsFyhmzgqDM7Kj+2gGo82hnswBEVTGWegJjl6R
 yDl7CrHBhJzothPJ1SCSbXPnpy0+AhH5X4gCyYkDdV+IE2VAtZMx4UbVr9ps57Sr62Wl
 njpgbJP7UVhm690CDuUY+9xRbvqdXCwLnhUHngYPZS/yai19LSJrAvRJzGzvWgf5GVKW
 AG2tk42Hpm5jaZfHx/sJHcDnG12DgnHJJ/U/ha9WrTsBckNpGyRLXr3BTN2Z+VyMhMt+
 wkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yyrx3sNY97qpxZofH/wQKp6HlhF94w1O2QAMnNFBt/M=;
 b=HfubeDONXxVv0Z7xezsMNIUm3SIUDD54qR+Q8GC9AK588h0mjU87TMCMRk2qEfajYk
 KhqwyxCQRgOPx4dt91R6UcnOUe1W7etziLuOs+rwmaA/pqFkLnYNqF4AfeETdPrjxTNP
 ordZqQjxobWIhYi+iTAT1pmIsfqfgmTBnajEtnr50ASwL/Wu1MM2xnaPlxVxWhAWfLhQ
 aF+cTNucGtsoL7841MTdkuqyH/o6wB3yWSvDjCshRdWF41c0UsR6SZnmw7kKu+f8asnT
 RFABLbGM+y42O35oEZGvUT20g3TT3kC7zcGuQrOSdvtkW69FrPIQHk/cLBxs0tVBDqNx
 hG9A==
X-Gm-Message-State: AOAM530KbeSYDSTgnqnbiBs9UIv23U3XwVlpJlZpWScgzT73zYdwh8AI
 P3mVNileekLzMVSpMZCs6OicPA==
X-Google-Smtp-Source: ABdhPJwmpyChF48T3ZB1TpNmSz1OCRiRr7L+cuDcZFzNli/wiI6Zlcj3CoHbSJ+L0/u7jQzP6XNv0g==
X-Received: by 2002:a63:5d0c:: with SMTP id r12mr3878098pgb.44.1598752640972; 
 Sat, 29 Aug 2020 18:57:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id r3sm1183807pfh.88.2020.08.29.18.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 18:57:20 -0700 (PDT)
Subject: Re: [RFC v4 69/70] target/riscv: gdb: support vector registers for
 rv64
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Hsiangkai Wang <kai.wang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-70-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cc7f2642-4a9a-c494-43b9-5c99cb8c9bd8@linaro.org>
Date: Sat, 29 Aug 2020 18:57:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-70-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sun, 30 Aug 2020 01:57:24 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> +++ b/gdb-xml/riscv-64bit-csr.xml
> @@ -248,4 +248,11 @@
>    <reg name="mucounteren" bitsize="64"/>
>    <reg name="mscounteren" bitsize="64"/>
>    <reg name="mhcounteren" bitsize="64"/>
> +  <reg name="vstart" bitsize="64" group="vector"/>
> +  <reg name="vxsat" bitsize="64" group="vector"/>
> +  <reg name="vxrm" bitsize="64" group="vector"/>
> +  <reg name="vcsr" bitsize="64" group="vector"/>
> +  <reg name="vl" bitsize="64" group="vector"/>
> +  <reg name="vtype" bitsize="64" group="vector"/>
> +  <reg name="vlenb" bitsize="64" group="vector"/>

Just because these are csr's doesn't mean they're unrelated to RVV.  I would
think that ideally they would be in the (generated) RVV-related xml file.

But I'm certainly not a gdb expert.  So if that doesn't work, fine, leave it as is.

However, if you leave these in the csr section, I think the next patch has to
be folded in, because you've already included

>  #if defined(TARGET_RISCV32)
>      gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
> -                             241, "riscv-32bit-csr.xml", 0);
> +                             248, "riscv-32bit-csr.xml", 0);

... this.

That said, the actual dynamic xml looks fine.


r~

