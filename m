Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNZ0i-000782-61
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 02:57:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZ0e-0006vC-Do
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:57:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZ0N-0000iu-NC
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:57:40 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44573)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNZ0N-0000iH-G0
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:57:31 -0500
Received: by mail-wr1-x434.google.com with SMTP id j17-v6so23818746wrq.11
	for <qemu-riscv@nongnu.org>; Thu, 15 Nov 2018 23:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=2upc2f86SJtYqC4xXLNLDIx+BVtQVG4tcbfdYsTNT/I=;
	b=gBUsbhI2vmL+vAnaB51hXasrmo2yGCs8IjsmHns3fUe8TPCOeCivw9+D4xbtulBLvr
	S5STSiASf2i7f/LhPoqcQjUZiOvoqb9vg7f/elDXDWNdZfDfKbUxYQj6R/+wVNPMIkDW
	qKs03Fj32Ycd6BlZ0UuDZ2GWTMa9Iu54P9LQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2upc2f86SJtYqC4xXLNLDIx+BVtQVG4tcbfdYsTNT/I=;
	b=GMKE6Mu3AEcwSgp7NaLrXTiqC9totJ9ALgcAjp8XqWEn0n7WB24bBNriGjV4pta5no
	Ka+mqNIF34mLI+0V2aVoV2P7PTdJpuEbgUnjeOWoNBPG+lytcyxV0Nr6iEmag2h0ILV7
	0PnMmebGs8p/EC7prOTFi+ElB8Jzkg6oeMX3wMlrDZJAhuE/4O323gkUHyQdCjIPYUR8
	U/IehzqmTWapJxlFrIjl4nCBnBrTJ2LP7ggHlFHdHo3HLI8v1oNxpxpr4AR6Wsaf7qg8
	YAcOdueMdNPXdZaZzhO7arovPEZuPVm9eBr5WxlcNqtGoxeR3x1/XhXKkNQL1Jsqh0Vm
	Vxgw==
X-Gm-Message-State: AGRZ1gIPuLMOITJ5owzdjgkevKxf20QaoRz/f4nfEOY32b9EVtVdyG/v
	1mwQqUMjGO8/oy6/DjHhShjnzA==
X-Google-Smtp-Source: AJdET5f9oNRJzxRx9UYi2YoWpnpQff/K23YErWhV5pY2sbhLfyXgzjMQDlz/KwSDLu3yDd/Xd/HCXw==
X-Received: by 2002:adf:bc0c:: with SMTP id
	s12-v6mr8365750wrg.255.1542355050372; 
	Thu, 15 Nov 2018 23:57:30 -0800 (PST)
Received: from cloudburst.twiddle.net
	(57.red-213-99-142.dynamicip.rima-tde.net. [213.99.142.57])
	by smtp.gmail.com with ESMTPSA id
	64-v6sm24165529wml.22.2018.11.15.23.57.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 23:57:29 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<0f62035eb86da24f03b9980f086d6df268105986.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1d636617-9b92-e437-6648-28744adbf58d@linaro.org>
Date: Fri, 16 Nov 2018 08:57:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <0f62035eb86da24f03b9980f086d6df268105986.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::434
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 03/23] linux-user: Add host
 dependency for RISC-V 64-bit
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Nov 2018 07:57:51 -0000

On 11/15/18 11:34 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  linux-user/host/riscv64/hostdep.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 linux-user/host/riscv64/hostdep.h


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


