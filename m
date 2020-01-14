Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irC0H-0001uh-Sg
	for mharc-qemu-riscv@gnu.org; Mon, 13 Jan 2020 21:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51096)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1irC0E-0001p0-Sx
 for qemu-riscv@nongnu.org; Mon, 13 Jan 2020 21:32:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1irC0D-0004V1-MU
 for qemu-riscv@nongnu.org; Mon, 13 Jan 2020 21:32:22 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42661)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1irC0D-0004Sn-DN
 for qemu-riscv@nongnu.org; Mon, 13 Jan 2020 21:32:21 -0500
Received: by mail-pf1-x432.google.com with SMTP id 4so5816511pfz.9
 for <qemu-riscv@nongnu.org>; Mon, 13 Jan 2020 18:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JdqfIiYkq/VKmhsBw7D0uiWQSjkGafNQwfuH6P8ZXls=;
 b=WPq4mNWv60VwEnNpYEK4sQHEH5vKsMc+3bxnP28yojQVDDWURcvta0tiiW2bychPpg
 8tZX4ysSNW6Md90jThTFBrZ3+ZkgkujNJfkG5HeSWuXzuie2vOwNZl/JC3vnaCFGNz2o
 4PgKbhTvF83AcOm8Ap5Lhm3QnzN1hp1fZEjfgdSpTFOIPHCuFyubiEWXebGjf7XOPu2k
 YK8VGoWmtQvEQGfgc53NBcwdiu1H/KTMzVNtYDiZy1bzct4zF2dM1UuEjtA+iM1XERIq
 zJc1ZUAUbMzGFLJu6ORiNWE/4loBtTxLv4SoNgy0jrjAOkVN9O6SjuZzmUGGMxRGsu/4
 ItDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JdqfIiYkq/VKmhsBw7D0uiWQSjkGafNQwfuH6P8ZXls=;
 b=PVbPNpfcut2fIENKUVx0Y8Qya+PRpe878yoG71r+jNRwCVdwdnUnL/5Em+CAjgLWjN
 PZwBJ+nO9nMp++8kzJMrYcZl9hwSciOTAdFoYayALVlBFa/F6TVi2eA7373K3wjucYcO
 pKdn4sGxKzO1dAfMIHwQCiNCskBp73jQArEp+gyq2e7E0pR7PD+I5OFcTSz+i3Bw9Rnt
 rOeQ48wwz86++Jrv0nD0PTC9ih/SigMCC4AJoqfgYXPpwFGnU9viWF1v6WFFhIBJgq+0
 QmSn+wzf0RDLybR11bYWZWjElRogEX3+v3ajTjeS5hfJTibadN+DmlU+BhMprlRdUv6t
 Wm+A==
X-Gm-Message-State: APjAAAUwM9pEsv7HzGmLNWjiO94iqlBs8SGCEDIzvtetBVDiGgybpHt1
 Xg/oTK/kig1rSND5kNdwSvWtgw==
X-Google-Smtp-Source: APXvYqzs8RpM/TsARJGwA9Qg+uy4YQ9zHVygIku2hvo5QKrWM7T7ovYpuPKsBIi1DkZial4/hAEcqg==
X-Received: by 2002:a63:e0f:: with SMTP id d15mr24122546pgl.255.1578969138694; 
 Mon, 13 Jan 2020 18:32:18 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id d129sm16140203pfd.115.2020.01.13.18.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 18:32:17 -0800 (PST)
Subject: Re: [PATCH] target/riscv: Set mstatus.DS & FS correctly
To: shihpo.hung@sifive.com, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <1578647134-13216-1-git-send-email-shihpo.hung@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <19df333a-9a93-d3af-e7ab-fce212bb4978@linaro.org>
Date: Mon, 13 Jan 2020 16:32:13 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1578647134-13216-1-git-send-email-shihpo.hung@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::432
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
X-List-Received-Date: Tue, 14 Jan 2020 02:32:24 -0000

On 1/9/20 11:05 PM, shihpo.hung@sifive.com wrote:
> Because ctx->mstatus_fs changes dynamically during runtime, we should
> remove the mstatus_fs check at the translation stage.

This change is incorrect.

The actual bug is in cpu_get_tb_cpu_state(), as I just noticed during review:

"[PATCH 2/3] RISC-V: use FIELD macro to define tb flags"
https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg02455.html


r~

