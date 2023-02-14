Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRwL0-00061A-RL
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 09:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pRwKz-0005yh-65; Tue, 14 Feb 2023 09:31:17 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pRwKw-0004LP-PK; Tue, 14 Feb 2023 09:31:16 -0500
Received: by mail-ed1-x52d.google.com with SMTP id fi26so17642549edb.7;
 Tue, 14 Feb 2023 06:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A7vIEGkPHf2DzKRTksnsfX9U6kO6Xso4VrCP4RZlc2s=;
 b=iTsuB4gLqF1EC0BBzMt7JHzw7lV30AbA0jv/0S/JjAUEXMw8hKSAOVMOC9Kca3Gdb1
 /xhb2Tq6rcrzP4w1Age2YgP+Mv72hoOrxO8OkTxfNbT69XEhyaNAWxJFYob50SA3Nat1
 eeghFKO90dvcA/1MLZocNstMlBr5QKomMntqPCPuE+AgxMTmGJSKc84DIzAml2SBdPAw
 73uikzcmwx64XB98aUs9dHdnrQNjy47G+FE1Riopxv+IPS6+pYyN+43eRpjmALwxCQj6
 m4eoHOGFzX1HRAQm/8/4u56iDnXJYigZ7ahTar6DwAF3/E1bG2ySDXPYzmg+XYxBoahL
 Fs0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A7vIEGkPHf2DzKRTksnsfX9U6kO6Xso4VrCP4RZlc2s=;
 b=oHpx6jGq0jvPjo8TtERKteRrF30G/kVZZSJezhj6mrv7mS0m2YHggnClIS5uZ/jccw
 7pWPyjJM1VfI/EZnyDPoj+ohddcgQ3nhfHYIDRHqtKrdgHzMn//GLpP6w7C+VSjmDOAG
 N/2RX9n7XDO6rMo5NPUWCR6mC8sytjFAUc8e6vsfoePPYkPSxaR8HBVlbBe1QdmaLjMl
 uwwjgFKCZnHMNMVLnC8Tr1UN+aXGhPXWxVICARz3og7Z/I1SXxNZXytIYPlkWF0dKQ3y
 TKkYfmRXjU8hEC2fr/1CcXZnsQzlt4WZOMnMeYhgPCdrTG2TPLVUaz0wTvO9HiOG2jbo
 BGoQ==
X-Gm-Message-State: AO0yUKVsxQ78wXC9bBgq9chV2M2ZkYoCgyUTDNdmc4whhXHFk3Y7BF/3
 DJ1UEr7xhdYNPoZFJmgkxMeE19+AeljyD9Sm91s=
X-Google-Smtp-Source: AK7set9XFxSfvH4zkUoN4lZMhyF4XMZAh8Mk0XLOv8rwzlbCnyLhU9cAfv3yEUMg/cQjjMib2jxMrhmYxXAvKZIzElA=
X-Received: by 2002:a50:8e52:0:b0:4ac:8359:e846 with SMTP id
 18-20020a508e52000000b004ac8359e846mr1236997edx.6.1676385072409; Tue, 14 Feb
 2023 06:31:12 -0800 (PST)
MIME-Version: 1.0
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <471ae407-3fe2-5e2f-374b-9c4c83a16fdf@ventanamicro.com>
In-Reply-To: <471ae407-3fe2-5e2f-374b-9c4c83a16fdf@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 14 Feb 2023 22:31:01 +0800
Message-ID: <CAEUhbmUNF2xFw8aJeqy2ykfG_1PdTz6qvCHnWo-hP7sSNbAU_Q@mail.gmail.com>
Subject: Re: [PATCH 00/18] target/riscv: Various fixes to gdbstub and CSR
 access
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 14 Feb 2023 14:31:17 -0000

Hi Daniel,

On Tue, Feb 14, 2023 at 3:20 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Bin,
>
>
> I received only patches 1-11. I don't see the remaining patches in patchwork:
>
>
> https://patchwork.kernel.org/project/qemu-devel/list/?series=721372
>
>
> or in the qemu-devel archives:
>
>
> https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03461.html
>
>
> Can you please verify? Thanks,
>

Somehow my email service provider blocked some of my patches. I've now
resent the missing patches, and I just verified that it showed up in
the patchwork.

Regards,
Bin

