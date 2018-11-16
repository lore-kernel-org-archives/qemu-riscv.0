Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNZ1f-0007mG-Ce
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 02:58:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZ1a-0007iZ-Fv
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:58:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZ1Y-0001Op-HW
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:58:46 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50368)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNZ1W-0001Io-HY
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:58:44 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 124-v6so21243747wmw.0
	for <qemu-riscv@nongnu.org>; Thu, 15 Nov 2018 23:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=w5wQFtO77EMzh5woZ1J3CEbSZFoK8Y8G87JatsRlMps=;
	b=i5BJ0uS1ducPazZj0KOLhQnTipH+bfQlRRjZp7tDRqITdBtAlQlRPGKSXnWtE/t3Vn
	wG1tL0IAsufesRcRPc7f3A82IkcYEx183/yFTfu7byppB8eDRQiP2RNr9k4V/kGV+4+4
	gJp1NW6ZmwlKziozcYy9xj1qIs+GWS7WSM3pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=w5wQFtO77EMzh5woZ1J3CEbSZFoK8Y8G87JatsRlMps=;
	b=s6iBrNnlsdwD5rBvAL5iL+Qm8Xa6i/l/0jT2sWQ47ERu51S1t5TEAmJ526pWZtyyFA
	80/atwozLfHdaXVMUWk4v6JeCbnpdFYH12jHATJJRufF+TNfj539n3xeEzNMRPOXZHjG
	byueEmtVwHEAOkydqZu7xKMj0OlcPxV4hRSG5U2mdkDHFiwu0FD+pjDvsmdYe0idPP8v
	KjHDRWegACZin98qdaYPgBWOhoLHNjIO5KvVwZkdJ/p+CbQLYotP/rPWfLUGmbxvYjBZ
	MIPkDKYdztlFy4ixFg+YOB5sbDxPGhZf/t29yylLRTuxyBn05drnSFVPccTmmh2vE1FG
	ivFg==
X-Gm-Message-State: AGRZ1gJv9yFOPuB6nKKNqKZssWZy6K69rjV1GqqTiUwReO7pPAwDQ5YJ
	Wc4+T2PQYSpF2KsDXLjwj4GmZg==
X-Google-Smtp-Source: AJdET5eQxRBupnmJFnKCDquyrxH+itgy5gevqzCqxLr+rgEqvFBtwM8Z9e6JJxyHygl48yK7YUM9XA==
X-Received: by 2002:a1c:a6d7:: with SMTP id p206mr3642046wme.143.1542355108128;
	Thu, 15 Nov 2018 23:58:28 -0800 (PST)
Received: from cloudburst.twiddle.net
	(57.red-213-99-142.dynamicip.rima-tde.net. [213.99.142.57])
	by smtp.gmail.com with ESMTPSA id
	k66-v6sm29418646wmd.47.2018.11.15.23.58.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 23:58:27 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<a960531f6b2a08f327d3526580b24a36317b7a8c.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a644ab74-9380-7c38-707d-a43d6b359451@linaro.org>
Date: Fri, 16 Nov 2018 08:58:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <a960531f6b2a08f327d3526580b24a36317b7a8c.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::32a
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 06/23] riscv: Add the tcg
 target registers
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
X-List-Received-Date: Fri, 16 Nov 2018 07:58:49 -0000

On 11/15/18 11:34 PM, Alistair Francis wrote:
> +
> +#define TCG_CT_CONST_ZERO  0x100
> +#define TCG_CT_CONST_S12   0x200
> +#define TCG_CT_CONST_N12   0x400

Logically this would go with patch 8.  But,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



