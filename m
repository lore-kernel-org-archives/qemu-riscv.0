Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h7nk1-0001K2-My
	for mharc-qemu-riscv@gnu.org; Sat, 23 Mar 2019 16:59:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h7njs-0000hJ-0Q
	for qemu-riscv@nongnu.org; Sat, 23 Mar 2019 16:59:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h7nby-0006Bn-EK
	for qemu-riscv@nongnu.org; Sat, 23 Mar 2019 16:51:27 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34886)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h7nbx-0006B4-N9
	for qemu-riscv@nongnu.org; Sat, 23 Mar 2019 16:51:26 -0400
Received: by mail-pf1-x441.google.com with SMTP id t21so3779716pfe.2
	for <qemu-riscv@nongnu.org>; Sat, 23 Mar 2019 13:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UPL4AXc9q7lhlI+Uvf3gFDGUV/Mc8IfOaMR212a64hw=;
	b=w1jR/79TYWXCmny+KewbYhKolTyEwnOsUzLet7YL6k1JKS1pzfNx8pPu6tKrnqLJGd
	3dC3W8PhTMUvZ0EwoQ7Vq50Zpor7PwNNsTxRII1r8P9ouBV5kL9eH62pV/X+VofSu0L6
	yeFemBH61LUNeR9dWgeb0GytiRlgQ2n+vyaEk3MFyb5E9KAx5OcuJv6QtFOK4cCix0GK
	EoPsDlOeS8QrWqyfZx8MFYjuWYRB/InZsqVeyEqXQOgzo37jc9WJZuoiQ0rJAnF4Ivkg
	YBhYK43nJbFr0PuSwOE3qPmt+wPRH6lkY6MTuEVsVFzKawM6/1+R9KaIc1zXsZl0Wf/v
	yKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UPL4AXc9q7lhlI+Uvf3gFDGUV/Mc8IfOaMR212a64hw=;
	b=WLvPku80iipjXaOACHxukI5iQfamK9fAgP3vO04OLSg4R+r54VuRc+GXH/Tl7pRxlZ
	7FAilKBrUlypSIt6n65/2LBUtCbdDeVPvT6iimybgUYa5g6Efg83lSew9J6neIoormsk
	Ij24d2fSSuwLm2vs0YHyt2xIyVXr63Je1r59/I08sl/vuiOTZeLWZUHOY1vFitB2yC5y
	Se0avW/IXBLTjLC/IzpsuBb992XpCRjYWNyymfOi/xyH+ImCXY5ZTuNR3ZHzqNlppuSp
	5NZpTzuzqD9LgvmlXg+vp0QjQGDKgWZ2NlL1ec500tAnxpi45Dudz8a8neJrIegBMe/w
	U4Jw==
X-Gm-Message-State: APjAAAVv5iDZuooDkBytponl6opDDliLbkSD2EnpWA0F3oGf/YuMOziV
	ocwm1WbJUb2CNE8zoh/MknDUcA==
X-Google-Smtp-Source: APXvYqwryTt+H4/ZAZEcQ8S8jiu78xxVcHWr2QCf+ag1GE+zfwv5YG7JAN5fsyg0y97gKhQ7yG8TBA==
X-Received: by 2002:a62:29c6:: with SMTP id
	p189mr16621539pfp.194.1553374284531; 
	Sat, 23 Mar 2019 13:51:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-5-201.tukw.qwest.net. [174.21.5.201])
	by smtp.gmail.com with ESMTPSA id
	k3sm26412278pfc.59.2019.03.23.13.51.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Mar 2019 13:51:23 -0700 (PDT)
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	Kito Cheng <kito.cheng@gmail.com>, qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20190322204320.17777-1-cota@braap.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <64df8e3e-d6ee-f68e-86de-c5fc3d8da5b7@linaro.org>
Date: Sat, 23 Mar 2019 13:51:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190322204320.17777-1-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-riscv] [PATCH v2 for-4.0] hardfloat: fix float32/64 fused
 multiply-add
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
X-List-Received-Date: Sat, 23 Mar 2019 20:59:37 -0000

On 3/22/19 1:43 PM, Emilio G. Cota wrote:
> From: Kito Cheng <kito.cheng@gmail.com>
> 
> Before falling back to softfloat FMA, we do not restore the original
> values of inputs A and C. Fix it.


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


