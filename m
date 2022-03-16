Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nURxf-0002LS-Sj
	for mharc-qemu-riscv@gnu.org; Wed, 16 Mar 2022 07:37:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nURxd-0002Gr-0C; Wed, 16 Mar 2022 07:37:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45030
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nURxb-0000lw-3W; Wed, 16 Mar 2022 07:37:00 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22GAeTc9019617; 
 Wed, 16 Mar 2022 11:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=j+oEpH3fznUB2SJdAJnvlBPI1iF3lehUJ0ybu3TAOq0=;
 b=TQ7b00+BruqMhbEq+W/74Q9QaDbJ+NaRFXr13oWs4Rc0TNLEa42GDTN5GI8vJ77o1LHh
 YL1SlDHWZOH33W+tRD3nE4dhALFY+P+F5jE4Vhfjxm1LnpVsJboKAykWq4gAr4pVZ+i8
 BDHfJoFBjk4bHFJ/WrRsFnFF0hQCGfDHCRfkqptoccCZK/PLgsSM1rWr1+5mRUvWaV5r
 H2rjlAOZX/6mpXA5FjNWAozegTrP+7t7xSrh/2WhdbSwy5QQFFp83z8tI5SsQMykvvcm
 aGPoTExhqwjW7Ud5cdm1ls4Lb2alqrHTzYCEnWy0FHi9p7A6BERg8LWW46cjWXNF+79u yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eubv2vdk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Mar 2022 11:36:19 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22GBaIDw029256;
 Wed, 16 Mar 2022 11:36:18 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eubv2vdj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Mar 2022 11:36:18 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22GBPYNh010263;
 Wed, 16 Mar 2022 11:31:16 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3erk590vm7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Mar 2022 11:31:15 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22GBVCl250594262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Mar 2022 11:31:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B57BEAE04D;
 Wed, 16 Mar 2022 11:31:12 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB8F0AE051;
 Wed, 16 Mar 2022 11:31:10 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.15.48])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 16 Mar 2022 11:31:10 +0000 (GMT)
Date: Wed, 16 Mar 2022 12:31:08 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Dmitry
 Fleytman <dmitry.fleytman@gmail.com>, "open list:Overall KVM CPUs"
 <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Eric Farman <farman@linux.ibm.com>, Peter
 Xu <peterx@redhat.com>, Laurent Vivier <laurent@vivier.eu>, Yanan Wang
 <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Vikram Garhwal
 <fnu.vikram@xilinx.com>, "open list:virtio-blk" <qemu-block@nongnu.org>,
 David Hildenbrand <david@redhat.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Artyom Tarasenko <atar4qemu@gmail.com>, Pavel
 Pisa <pisa@cmp.felk.cvut.cz>, Huacai Chen <chenhuacai@kernel.org>, Thomas
 Huth <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, "open list:S390 SCLP-backed..."
 <qemu-s390x@nongnu.org>, "open list:ARM PrimeCell and..."
 <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, "open
 list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, "open list:RISC-V TCG CPUs"
 <qemu-riscv@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Coiby Xu
 <Coiby.Xu@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@kaod.org>, Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 10/27] Replace config-time define HOST_WORDS_BIGENDIAN
Message-ID: <20220316123108.682cffa0.pasic@linux.ibm.com>
In-Reply-To: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
References: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2lhrFj8YK1KMj5IEgT_DhS5MfG15b3Iv
X-Proofpoint-GUID: iE8-4jEe_MPMJmqf1GsXaW__ElJAfvuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-16_04,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 spamscore=0 impostorscore=0 mlxlogscore=992 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203160068
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 16 Mar 2022 11:37:02 -0000

On Wed, 16 Mar 2022 13:53:07 +0400
marcandre.lureau@redhat.com wrote:

> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Replace a config-time define with a compile time condition
> define (compatible with clang and gcc) that must be declared prior to
> its usage. This avoids having a global configure time define, but also
> prevents from bad usage, if the config header wasn't included before.
> 
> This can help to make some code independent from qemu too.
> 
> gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

LGTM

For the s390x parts I'm involved in:
Acked-by: Halil Pasic <pasic@linux.ibm.com>

[..]

> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -34,13 +34,13 @@
>  
>  /* some important defines:
>   *
> - * HOST_WORDS_BIGENDIAN : if defined, the host cpu is big endian and
> + * HOST_BIG_ENDIAN : whether the host cpu is big endian and
>   * otherwise little endian.
>   *
>   * TARGET_WORDS_BIGENDIAN : same for target cpu
>   */

This comment does not seem spot on any more. BTW would it make sense
to replace TARGET_WORDS_BIGENDIAN with TARGET_BIG_ENDIAN as well. I
believe the bad usage argument applies equally to both, and IMHO we
should keep the both consistent naming and usage wise.

>  
> -#if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
> +#if HOST_BIG_ENDIAN != defined(TARGET_WORDS_BIGENDIAN)
>  #define BSWAP_NEEDED
>  #endif
>  

[..]

