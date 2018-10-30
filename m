Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHaCm-0000uN-6X
	for mharc-qemu-riscv@gnu.org; Tue, 30 Oct 2018 16:01:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHYC4-0007Aq-Ew
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 13:52:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHYC0-0004Bj-1F
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 13:52:44 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46196)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gHYBz-0004Ar-N3
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 13:52:39 -0400
Received: by mail-wr1-f66.google.com with SMTP id 74-v6so5393138wrb.13
	for <qemu-riscv@nongnu.org>; Tue, 30 Oct 2018 10:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=01BtDmWX0EcndkVJ652XB12mX+GutR9BVh7hix1zftQ=;
	b=W7VI3BG210WQVIvPfAc04jhxMaZ3Dv/Ge8pfRC2x5HdEMcbztJMy6rRhDi6ijfQJMM
	mEy0q4cw6X5ic0r9esMWqiIi29kc/5NdoS0f6ggXxv7tujpW6ryyJcuJo3fvauekpRl/
	U7rS+RyVRnZJipzfWL3lo6LHRlV+re3Z2v7j19zHUfSrg2McVD/H28JaI+dk2jzFSejK
	mfI2BS6RmQRL1y+bzlqfuiYXh4VhHlM/yVvMIDbLP6mFNYAgvf2IMdT/Pn5kjnMbdGAK
	eoCsUwZaTMrKkHgO8kTlR6s/UD5dUC+PFDjUpna3fstGef+S3/fKWlrcePAbAuGUKUZM
	NgAQ==
X-Gm-Message-State: AGRZ1gIHD9bL4nZIk/tsBHVd41DQBlHfMR4H4/GMMYieIsoH1yzqN7GL
	EspYDWdzq0aXdPaCXASi+/8rmA==
X-Google-Smtp-Source: AJdET5eiOmB1bT9ZBwy/47fkaSa/T3zHiY4fFG9EGgIYF9KzP+lMa4VWRL35TJ+j+7erw4wdCrWviA==
X-Received: by 2002:adf:9ccb:: with SMTP id
	h11-v6mr19981342wre.322.1540921958436; 
	Tue, 30 Oct 2018 10:52:38 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.13.138])
	by smtp.gmail.com with ESMTPSA id
	l67-v6sm45108919wma.20.2018.10.30.10.52.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 10:52:37 -0700 (PDT)
To: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
References: <20181030174356.16915-1-palmer@sifive.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dc417db4-7add-0870-b6b7-6a3e4ae92305@redhat.com>
Date: Tue, 30 Oct 2018 18:52:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181030174356.16915-1-palmer@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
X-Mailman-Approved-At: Tue, 30 Oct 2018 16:01:34 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] Add qemu-riscv@nongnu.org as
 the RISC-V list
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
X-List-Received-Date: Tue, 30 Oct 2018 17:52:48 -0000

On 30/10/18 18:43, Palmer Dabbelt wrote:
> We now have a RISC-V specific QEMU development list.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d550fd8b809c..10983bd52d64 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -244,6 +244,7 @@ M: Palmer Dabbelt <palmer@sifive.com>
>   M: Alistair Francis <Alistair.Francis@wdc.com>
>   M: Sagar Karandikar <sagark@eecs.berkeley.edu>
>   M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> +L: qemu-riscv@nongnu.org
>   S: Maintained
>   F: target/riscv/
>   F: hw/riscv/
> 

