Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gUWsT-0000a4-Us
	for mharc-qemu-riscv@gnu.org; Wed, 05 Dec 2018 08:06:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pasic@linux.ibm.com>) id 1gUTHg-0003Z9-IB
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 04:15:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pasic@linux.ibm.com>) id 1gUTHd-0001Co-DE
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 04:15:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pasic@linux.ibm.com>) id 1gUTHd-0001CC-4M
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 04:15:53 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	wB59AqFB129268
	for <qemu-riscv@nongnu.org>; Wed, 5 Dec 2018 04:15:52 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2p6btgr90y-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-riscv@nongnu.org>; Wed, 05 Dec 2018 04:15:52 -0500
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-riscv@nongnu.org> from <pasic@linux.ibm.com>;
	Wed, 5 Dec 2018 09:15:49 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
	by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 5 Dec 2018 09:15:45 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
	(b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id wB59FhWf54984836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 5 Dec 2018 09:15:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F834A4065;
	Wed,  5 Dec 2018 09:15:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C856BA405B;
	Wed,  5 Dec 2018 09:15:42 +0000 (GMT)
Received: from oc2783563651 (unknown [9.152.98.118])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  5 Dec 2018 09:15:42 +0000 (GMT)
Date: Wed, 5 Dec 2018 10:15:41 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Tony Krowiak <akrowiak@linux.ibm.com>, Palmer
	Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org, Pierre Morel
	<pmorel@linux.ibm.com>, Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Cornelia Huck
	<cohuck@redhat.com>, qemu-s390x@nongnu.org, Yuval Shaia
	<yuval.shaia@oracle.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>, Michael Clark
	<mjc@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>, Marcel
	Apfelbaum <marcel.apfelbaum@gmail.com>, Sagar Karandikar
	<sagark@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, Eduardo
	Habkost <ehabkost@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
	Richard Henderson <rth@twiddle.net>
In-Reply-To: <20181204172535.2799-1-armbru@redhat.com>
References: <20181204172535.2799-1-armbru@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18120509-0020-0000-0000-000002F2C635
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18120509-0021-0000-0000-00002142CE2B
Message-Id: <20181205101541.5de64eb4@oc2783563651>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-12-05_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1812050085
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
X-Mailman-Approved-At: Wed, 05 Dec 2018 08:06:08 -0500
Subject: Re: [Qemu-riscv] [qemu-s390x] [PATCH] Clean up includes
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
X-List-Received-Date: Wed, 05 Dec 2018 09:15:58 -0000

On Tue,  4 Dec 2018 18:25:35 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
> 
> This commit was created with scripts/clean-includes, with the changes
> to the following files manually reverted:
> 
>     contrib/libvhost-user/libvhost-user-glib.h
>     contrib/libvhost-user/libvhost-user.c
>     contrib/libvhost-user/libvhost-user.h
>     linux-user/mips64/cpu_loop.c
>     linux-user/mips64/signal.c
>     linux-user/sparc64/cpu_loop.c
>     linux-user/sparc64/signal.c
>     linux-user/x86_64/cpu_loop.c
>     linux-user/x86_64/signal.c
>     target/s390x/gen-features.c
>     tests/migration/s390x/a-b-bios.c
>     tests/test-rcu-simpleq.c
>     tests/test-rcu-tailq.c
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Halil Pasic <pasic@linux.ibm.com>

Thanks,
Halil


