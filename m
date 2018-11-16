Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNYqM-0000Hz-VJ
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 02:47:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNYqJ-0000Gd-Ml
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:47:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNYqG-0003yG-21
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:47:07 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51529)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNYqF-0003xr-Pb
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:47:03 -0500
Received: by mail-wm1-x335.google.com with SMTP id w7-v6so21051935wmc.1
	for <qemu-riscv@nongnu.org>; Thu, 15 Nov 2018 23:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FSQm1INZtW+T7++6Lqj0PLpmNBgDCS2y4znBattf45M=;
	b=Uf6LQKLNOa441glAXU/nUKEopHlo3yqMNBQD+cDretuKr9dOdk6j5mU6MwwtoCUiYu
	bQxIppPJVw6j54P2jkPyGLpnCEmuIm0RkUI5ppqR9BSSQjiaks+AyFUHQyB7H2Dqb1Pw
	MCkqM33fDhzYQIcP5b+X7DVS+nMb9o4RcqeEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FSQm1INZtW+T7++6Lqj0PLpmNBgDCS2y4znBattf45M=;
	b=ikROn8bBg+V+33QMI8DoCz6QUc+qlpUKmafgtbkL5dF3ccno1pkMQDnHQlxeVpzrUR
	z5tkyfCClvfWgEYSYFNdpHsU+2k4I8KkNxkf/OR7wLbPGgv4Z868Av+0VFvwM9kpDhjf
	XLUnDDIwHclZeWm/HsTwhkGSS81gCvDx9iZ5eDNrR4L2S3WOT0Wh2t3UBOIvMIkeZQdg
	u0Okg0llc63bKOl5MGTUb81FqRg0rl3dIGCJK0qNg3bjB1SMyusmxOBT/QFd2DUJAUnk
	3ePUmodprJBgWLNPFR83LVWeIsdb+6Quda85z+W9zmVBHy7YFpDnHCglXHCP5iiJSi4J
	6hPA==
X-Gm-Message-State: AGRZ1gJh0g1vpjacVxTGWgc650eP2uwvb77Adhx/NhhH+PM2lp0qQauv
	zG800KqwUXdPPktWR/cNCv0dBg==
X-Google-Smtp-Source: AJdET5fZXKha0gH/LfSfWuN+VpYQVlPxRdMqUu9tNpTAIZRFAQmMMfkbIwZnauvFtPbR1XXwyXZw5w==
X-Received: by 2002:a1c:f614:: with SMTP id
	w20-v6mr1518646wmc.136.1542354422699; 
	Thu, 15 Nov 2018 23:47:02 -0800 (PST)
Received: from cloudburst.twiddle.net
	(57.red-213-99-142.dynamicip.rima-tde.net. [213.99.142.57])
	by smtp.gmail.com with ESMTPSA id
	y34sm3053856wrd.68.2018.11.15.23.46.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 23:47:02 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<765fe28a07d96b0fbd642e5d5f01c123118db4f4.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6a43928a-9a6b-2e9d-5559-adf4a5cc7bf6@linaro.org>
Date: Fri, 16 Nov 2018 08:46:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <765fe28a07d96b0fbd642e5d5f01c123118db4f4.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::335
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 02/23] linux-user: Add host
 dependency for RISC-V 32-bit
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
X-List-Received-Date: Fri, 16 Nov 2018 07:47:09 -0000

On 11/15/18 11:34 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  linux-user/host/riscv32/hostdep.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 linux-user/host/riscv32/hostdep.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


