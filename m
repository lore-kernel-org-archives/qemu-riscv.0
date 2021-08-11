Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDmir-0007QV-0m
	for mharc-qemu-riscv@gnu.org; Wed, 11 Aug 2021 07:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mDmip-0007Pp-6c; Wed, 11 Aug 2021 07:48:35 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:46386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mDmim-00066m-R2; Wed, 11 Aug 2021 07:48:34 -0400
Received: from [172.17.10.6] (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id CB70C20775;
 Wed, 11 Aug 2021 11:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1628682509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzs2NFwPuG719KTe/soPKO5Ez+myyWARvjsCBwdObx0=;
 b=nehRqIjRDFngUL0me/gGz8GCZQgqnKKIFFHmW71DhIp7daVJ/01SKi5cryYczv6H6UbuCB
 cP4XJoKB3eqcufDeV0UFE5yYiwo4ZXbPH+HqcguCGyIiooTjbgvcN/deJaW7jeNMq0eE6k
 QmLrwkyJhBWBipzmeTzcv8NpBU+txAo=
Subject: Re: [PATCH 0/2] Set user creatable for flag ibex uart and plic
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Mark Burton <mark.burton@greensocs.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210811093838.18719-1-damien.hedde@greensocs.com>
 <CAFEAcA9xYv0942TB7szESLCDct2H4d2MT5kzZMHL6_d=rQh0Cw@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <fd9ea72a-e4b5-c68a-27e1-91751324cbcf@greensocs.com>
Date: Wed, 11 Aug 2021 13:48:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9xYv0942TB7szESLCDct2H4d2MT5kzZMHL6_d=rQh0Cw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 11 Aug 2021 11:48:35 -0000



On 8/11/21 1:15 PM, Peter Maydell wrote:
> On Wed, 11 Aug 2021 at 10:43, Damien Hedde <damien.hedde@greensocs.com> wrote:
>> This small series only consist in setting the user_creatable flag
>> of ibex_uart and ibex_plic devices. These two devices are already
>> using properties to configure themselves so nothing else is required.
>>
>> Note that this change alone will not allow creation of these devices
>> using -device cli option or device_add qmp command as they are sysbus
>> devices.
>>
>> We do that because we are currently working on adding the possibily
>> to configure/build a machine from qmp commands (see this rfc:
>> https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03706.html).
>> We are using these simple devices in order to test our additions.
>>
>> We prefer to send these 2 patches on a separate series as they are not
>> really related to the main topic. We will send a following series
>> for the additions.
> 
> No, these patches should go in with your other series that
> requires them, please. As standalone patches they are definitely
> wrong, because (as you note) you cannot usefully user-create a
> sysbus device like these from the command line.
> 
> Even there I'm not convinced that just marking the devices
> user-creatable is the right thing -- if we support creating
> a complete machine from QMP commands we probably want to think
> about whether that means we need to have separate categories
> of "only creatable from C code", "only creatable as part of
> QMP machine creation", "creatable on commandline but only
> for cold-plug", and "hotpluggable".
> 
> -- PMM
> 

I understand, we will put them in the main series where
we will discuss all of this.

Thanks,
--
Damien

