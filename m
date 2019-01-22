Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gm3in-0006Af-9X
	for mharc-qemu-riscv@gnu.org; Tue, 22 Jan 2019 16:36:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gm3il-0006AQ-Mg
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 16:36:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gm3ih-00039d-LN
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 16:36:33 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41886)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gm3ia-000334-EA
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 16:36:25 -0500
Received: by mail-pf1-x436.google.com with SMTP id b7so13227pfi.8
	for <qemu-riscv@nongnu.org>; Tue, 22 Jan 2019 13:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tSCm4y2T1vbekU05oi+VjzjhWsjI/1uc711spPGXeuI=;
	b=dHwDLgtsGHl3YPWN0Ue7o1pSNxg5q3YPucs3ghFqFJMAq5my+7A5F1cdpEUXz4W10o
	4oOkIsydmhOaKYaYN6c143Ecxob67JCSGe5sOveCusijgRIqDdIgm1SMeZ1kIH7kFb7R
	dmvhmXUFhHRQtpuUGFDuiGGE+X5i9w4i3o7Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tSCm4y2T1vbekU05oi+VjzjhWsjI/1uc711spPGXeuI=;
	b=oX76oL5oX2uXx9gmITOeLtWkLlD3ePWPCWgLX63bzWF9p6pEyKj3E9Wq6x4T1hRcAJ
	MZAZesyFNcfI+cOg3s8r+XG6HI+dEo+VTJvSIhxXmN+zl/UDEqvtcjDJE+fg19ogGKIy
	XJcQdr8cFyE71M4CwOfAjzQUlQNS0GDykcRQEmt/UM0VzLeU2PNjNVGjTaWLiQ2+PsO0
	/1Z6QTT61LFHXvQ/z6VI4sZkQXLoN/UXKGHeKzTnMTGFcTXJ0k8qZCfjtBI4LtN848e5
	9At2oFRMfrb6vRyNwJ0uH6f+2sWg3Y0zMyEp9mtQAhJA6UejDz54tgALxWVK3ceRn8MJ
	VUPg==
X-Gm-Message-State: AJcUukdw+Fo2RQWDnPwNxYhbE54CQpCvPf8b9tYAvhCoDVRYOZLCdbFs
	ZzDaR/UhdwxS1bdyVT/Ic1hvBQ==
X-Google-Smtp-Source: ALg8bN5N50DSvIfOC5UtuOJebaY9eT3FkEoWZDtbZmjbJEOBSoAJS9CQ8XeT/LSUcKvGLGTMAypiDQ==
X-Received: by 2002:a62:7892:: with SMTP id
	t140mr34997346pfc.237.1548192982141; 
	Tue, 22 Jan 2019 13:36:22 -0800 (PST)
Received: from cloudburst.twiddle.net ([170.173.8.12])
	by smtp.gmail.com with ESMTPSA id
	i184sm21430506pfc.41.2019.01.22.13.36.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jan 2019 13:36:21 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
References: <20190122092909.5341-1-kbastian@mail.uni-paderborn.de>
	<20190122092909.5341-20-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f3d4a095-4393-fdff-1acf-2e6d8e0073db@linaro.org>
Date: Tue, 22 Jan 2019 13:32:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190122092909.5341-20-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::436
Subject: Re: [Qemu-riscv] [PATCH v5 19/35] target/riscv: Convert quadrant 2
 of RVXC insns to decodetree
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
X-List-Received-Date: Tue, 22 Jan 2019 21:36:36 -0000

On 1/22/19 1:28 AM, Bastian Koppelmann wrote:
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
> ---
>  target/riscv/insn16.decode              |  31 ++++++++
>  target/riscv/insn_trans/trans_rvc.inc.c | 101 ++++++++++++++++++++++++
>  target/riscv/translate.c                |  83 +------------------
>  3 files changed, 134 insertions(+), 81 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

